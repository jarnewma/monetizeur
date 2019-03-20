class SubscriptionsController < ApplicationController
  def index
    @subscriptions = current_user.subscriptions.order(created_at: :desc)
  end

  def show  # GET /payment_methods/:id
      @subscription = Subscription.find(params[:id])
      @parasites_to_add = current_user.parasites - @subscription.parasites
  end

  def new
    @subscription = Subscription.new
  end

  def update
    @subscription = Subscription.find(params[:id])
    if @subscription.update(subscription_params)
      redirect_to subscription_path(@subscription), notice: 'Subscription edited'
    else
      render :edit
    end
  end

  def create        # POST /subscribtion
    @subscription = Subscription.new(subscription_params)
    @subscription.user = current_user
    if @subscription.save
      redirect_to subscription_path(@subscription), notice: 'New subscription added'
    else
      render :new
    end
  end

  def edit          # GET /payment_methods/:id/edit
    @subscription = Subscription.find(params[:id])
  end

  def update
    @subscription = Subscription.find(params[:id])
    if @subscription.update(subscription_params)
      redirect_to subscription_path(@subscription), notice: 'Subscription updated'
    else
      render :edit
    end
  end

  def add_parasite
    @subscription = Subscription.find(params[:id])
    params[:subscription][:parasite_ids].each do |para|
      @subscription.parasites << Parasite.find(para) unless para.blank?
    end
    @subscription.save
    redirect_to @subscription
  end


  def delete_parasite
    @subscription = Subscription.find(params[:id])
    @parasite = Parasite.find(params[:parasite])
    @relationship_to_destroy = SubscriptionParasite.where(parasite: @parasite).where(subscription:@subscription).first
    @relationship_to_destroy.destroy
    redirect_to subscription_path(@subscription)
  end

  def update_notification
    @subscription = Subscription.find(params[:subscription_id])
    @subscription.renewal_notification = !@subscription.renewal_notification
    @subscription.save
    redirect_to subscriptions_path
  end

  def destroy       # DELETE /payment_methods/:id
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
      # no need for app/views/restaurants/destroy.html.erb
    redirect_to subscriptions_path
  end

  def subscription_params
    params.require(:subscription).permit(:name, :subscription_type, :cost, :category, :creation_date, :renewal_notification, :notification_date, :payment_method_id, :subscription_id, :billing_date, :photo)
  end
end

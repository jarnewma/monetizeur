class SubscriptionsController < ApplicationController
  def index
    @subscriptions = Subscription.all
  end

  def show  # GET /payment_methods/:id
      @subscription = Subscription.find(params[:id])
  end

  def new
    @subscription = Subscription.new
  end

  def create        # POST /subscribtion
    @subscription = Subscription.new(subscription_params)
    @subscription.user = current_user
    if @subscription.save
      redirect_to subscription_path(@subscription), notice: 'Subscription method added'
    else
      render :new
    end
  end

  def edit          # GET /payment_methods/:id/edit
    @subscribtion = Subscription.find(params[:id])
  end

  def add_parasite
          @subscription = Subscription.find(params[:id])
    params[:subscription][:parasite_ids].each do |para|
      @subscription.parasites << Parasite.find(para) unless para.blank?
    end
    @subscription.save
    redirect_to @subscription
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
    redirect_to root_path
  end

  def subscription_params
    params.require(:subscription).permit(:name, :subscription_type, :cost, :category, :creation_date, :renewal_notification, :notification_date, :payment_method_id, :subscription_id)
  end
end

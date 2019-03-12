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

  def subscription_params
    params.require(:subscription).permit(:name, :subscription_type, :cost, :category, :creation_date, :renewal_notification, :notification_date, :payment_method_id)
  end
end

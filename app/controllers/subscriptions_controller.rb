class SubscriptionsController < ApplicationController
  def index
    @subscriptions = Subscription.all
  end

  def new
    @subscription = Subscription.new
  end
end

class PaymentMethodsController < ApplicationController

  def index
    @payment_methods = current_user.payment_methods
  end

  def show  # GET /payment_methods/:id
      @payment_method = PaymentMethod.find(params[:id])
      @subscriptions = @payment_method.subscriptions
  end

  def new           # GET /payment_methods/new
    @payment_method = PaymentMethod.new
  end

  def create        # POST /payment_methods
    @payment_method = PaymentMethod.new(payment_method_params)
    @payment_method.user = current_user
    if @payment_method.save
      redirect_to payment_method_path(@payment_method), notice: 'Payment method added'
    else
      render :new
    end
  end

    def destroy       # DELETE /payment_methods/:id
      @payment_method = PaymentMethod.find(params[:id])
      @payment_method.destroy
        # no need for app/views/restaurants/destroy.html.erb
      redirect_to root_path
    end

  def payment_method_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:payment_method).permit(:category, :card_nickname, :bank, :expiry_date, :expiry_notification)
  end

end

class PaymentMethodsController < ApplicationController

def index         # GET /payment_methods
    @payment_method = current_user.payment_methods
  end

#   def show          # GET /payment_methods/:id
#     @payment_method = Payment_method.find(params[:id])
#     @subscription = @payment_method.subscriptions.new
#   end

#   def new           # GET /payment_methods/new
#     @payment_method = Payment_method.new

#   end

#   def create        # POST /payment_methods
#     @payment_method = Payment_method.new(payment_method_params)
#     @payment_method.user = current_user
#     if @payment_method.save
#       redirect_to payment_method_path(@payment_method), notice: 'Payment method added'
#     else
#       render :new
#     end
#   end

#   def edit          # GET /payment_methods/:id/edit
#     @payment_method = Payment_method.find(params[:id])
#   end

#   def update        # PATCH /payment_methods/:id
#     @payment_method = Payment_method.find(params[:id])
#     if @payment_method.update(payment_method_params)
#       redirect_to payment_method_path(@drone), notice: 'Payment method updated'
#     else
#       render :edit
#     end
#   end

#   def destroy       # DELETE /payment_methods/:id
#     @payment_method = Payment_method.find(params[:id])
#     @payment_method.destroy

#       # no need for app/views/restaurants/destroy.html.erb
#     redirect_to root_path
#   end
# end

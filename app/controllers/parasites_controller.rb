class ParasitesController < ApplicationController
def index
  @parasites = Parasite.all
end

def show
  @parasite = Parasite.find(params[:id])
end

  def new
    @parasite = Parasite.new
  end

  def create

    @parasite = Parasite.new(name: parasite_params[:name], parasite_email: parasite_params[:parasite_email], notify_parasite: parasite_params[:notify_parasite])
    @parasite.user = current_user
    @subscription = Subscription.find(parasite_params[:subscription_id].to_i)
    if @parasite.save
      redirect_to subscription_path(@subscription), notice: 'Friend added'
    else
      render :new
    end
  end

  def destroy
  end

  def parasite_params
    params.require(:parasite).permit(:name, :parasite_email, :notify_parasite, :subscription_id)
  end
end

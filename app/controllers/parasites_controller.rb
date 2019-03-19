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
    if @parasite.save

     return  redirect_to(subscription_path(parasite_params[:subscription_id]), notice: 'Friend added' ) unless parasite_params[:subscription_id].blank?
      redirect_to my_profile_path
    else
      render :new
    end
  end

  def destroy
    @parasites = Parasite.find(params[:id])
    @parasite.destroy
      return  redirect_to(subscription_path(parasite_params[:subscription_id]), notice: 'Friend added' ) unless parasite_params[:subscription_id].blank?
      redirect_to my_profile_path
  end

  def parasite_params
    params.require(:parasite).permit(:name, :parasite_email, :notify_parasite, :subscription_id)
  end
end

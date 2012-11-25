class ContractorSessionsController < ApplicationController
  
  def new  
  end
  
  def create
    @contractor = Contractor.find_by_email(params[:email])
      if @contractor && @contractor.authenticate(params[:password])
        session[:contractor_id] = @contractor.id
        redirect_to contractor_url(session[:contractor_id]), notice: 'Catches are ready for your Harpuun!'
      else
        flash[:notice] = "Invalid email address or password"
        render 'new'
      end
  end
  
  def destroy
    session[:contractor_id] = nil
    redirect_to root_url
  end
  
end
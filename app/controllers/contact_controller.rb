class ContactController < ApplicationController

  
  def index
  end

  def new
    @profile = Profile.new
    @profile.images.new
    
  end

  def confirm
    @profile = Profile.new(profile_params)
    redirect_to new_contact_path if @profile.invalid?
      flash[:profiles] = "まだ未入力の項目があります"
  end

  def create
    @profile= Profile.new(profile_params)
    if @profile.save
      redirect_to new_contact_path
      flash[:profile] = "お疲れ様です。提出が完了しました！"
    else
      redirect_to new_contact_path
      flash[:profiles] = "まだ未入力の項目があります"
      
      
    end
  end

  def show
   
    basic_auth
    @profile = Profile.includes(:images).order('created_at DESC')
    
  end


  def destroy
    @profile = Profile.find_by(id:params[:id])
    if @profile.destroy
      redirect_to contact_path
    else
      redirect_to contact_path
    end
  end


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end

  def profile_params
    params.require(:profile).permit(:name,:kana,:phone_number,:mail,:number,:undergraduate,:subject,:gpa,:motivation,:pr,:life,:time,:task,images_attributes: [:src,:_destroy, :id])
  end

end



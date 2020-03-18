class ContactController < ApplicationController
  def index
  end

  def new
    @profile = Profile.new
    @profile.images.new
    
  end

  def create
    @profile= Profile.new(profile_params)
    if @profile.save
      flash[:profile] = 'お疲れ様です！提出が完了しました！！'
      redirect_to new_contact_path
    else
      flash[:profile] = 'まだ未入力の蘭があります'
      redirect_to new_contact_path
    end
  end

  def show
    @profiles = Profile.all
    @profile = Profile.includes(:images).order('created_at DESC')
    @images = Image.all
    
  end


  private

  def profile_params
    params.require(:profile).permit(:name,:kana,:number,:undergraduate,:subject,:gpa,:motivation,:pr,:life,:time,:task,images_attributes: [:src,:_destroy, :id])
  end
  
end



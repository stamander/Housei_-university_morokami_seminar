class ContactController < ApplicationController
  def index
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile= Profile.new(profile_params)
    if @profile.save
      redirect_to root_path
    else
      redirect_to new_contact_path
    end
  end

  def show
    @profile = Profile.all
  end


  private

  def profile_params
    params.require(:profile).permit(:name,:undergraduate,:subject,:gpa,:motivation,:pr,:life,:time,:task)
  end
  
end



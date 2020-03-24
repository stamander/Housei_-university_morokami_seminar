class ContactController < ApplicationController

  
  def index
  end

  def new
    @profile = Profile.new
    @profile.images.new
    
  end

  def confirm
    @profile = Profile.new(profile_params)
    render :new if @profile.invalid?
  end

  def create
    @profile= Profile.new(profile_params)
    respond_to do |format|
    if params[:back]
      format.html { render :new }
    elsif @profile.save
      format.html { redirect_to @award, notice: 'Award was successfully created.' }
      format.json { render :show, status: :created, location: @profile }
    else
      format.html { render :new }
      format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
   
    basic_auth
    @profile = Profile.includes(:images).order('created_at DESC')

    
  end


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end

  def profile_params
    params.require(:profile).permit(:name,:kana,:number,:undergraduate,:subject,:gpa,:motivation,:pr,:life,:time,:task,images_attributes: [:src,:_destroy, :id])
  end

end



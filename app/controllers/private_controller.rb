class PrivateController < ApplicationController

  before_action :basic_auth,only: [:new,:destroy]

  def index
  end

  def create
    @private= Private.new(private_params)
    if @private.save
      redirect_to root_path
    else
      redirect_to new_private_path
      flash[:private] = "まだ未入力の項目があります"
      
      
    end
  end




  # def new
  #   @private = Private.new
  # end

  def show
    @privates = Private.find_by(id:params[:id])
  end

  def destroy
  
    @private = Private.find_by(id:params[:id])
    if @private.destroy
      redirect_to root_path
    else
      redirect_to private_path
    end
  end



  private
  def private_params
    params.require(:private).permit(:title,:content)
  end
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end
end

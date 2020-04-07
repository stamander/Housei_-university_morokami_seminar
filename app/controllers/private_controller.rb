class PrivateController < ApplicationController
  def index
  end

  def create
    @private= Private.new(private_params)
    if @private.save
      redirect_to new_contact_path
      flash[:profile] = "お疲れ様です。提出が完了しました！"
    else
      redirect_to new_contact_path
      flash[:profiles] = "まだ未入力の項目があります"
      
      
    end
  end




  def new
    @private = Private.new

  end

  private
  def private_params
    params.require(:private).permit(:title,:content)
  end

end

class PrivateController < ApplicationController
  def index
  end


  def new
    @private = Private.new

  end
end

class FrontController < ApplicationController
  def index
    @privates = Private.all
  end

  def new
  end
end

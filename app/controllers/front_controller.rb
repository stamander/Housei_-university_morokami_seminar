class FrontController < ApplicationController
  def index
    @privates = Private.all
  end
end

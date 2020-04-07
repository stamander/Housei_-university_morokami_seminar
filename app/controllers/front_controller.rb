class FrontController < ApplicationController
  def private
    @privates = Private.all
end

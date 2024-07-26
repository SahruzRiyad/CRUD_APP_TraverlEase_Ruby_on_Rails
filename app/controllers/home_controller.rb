# app/controllers/home_controller.rb

class HomeController < ApplicationController
  def index
    @user = User.new
  end
end

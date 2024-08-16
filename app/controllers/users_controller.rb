class UsersController < ApplicationController
  def create
    puts "---create!---"
    redirect_to root_path
  end
end

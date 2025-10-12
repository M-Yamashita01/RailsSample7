class UsersController < ApplicationController

  attr_accessor :name, :name2, :email

  def initialize
    @name = "test_user"
    @email = "example@exmaple.com"
    @name2 = "test_user2"
  end

  def create
    puts "---create!---"
    User.create!(name:, email:)

    redirect_to root_path
  end

  def create_save
    puts '---create!---'
    user = User.create!(name:, email:)
    puts '---save!---'
    user.name = name2
    user.save!

    redirect_to root_path
  end

  def create_update
    puts '---create!---'
    user = User.create!(name:, email:)
    puts '---update!---'
    user.update!(name: name2)

    redirect_to root_path
  end

  def save
    puts '---save!---'
    user = User.new(name:, email:)
    user.save!

    redirect_to root_path
  end

  def save_save
    puts '---save!---'
    user = User.new(name:, email:)
    user.save!
    puts '---save!---'
    user.name = name2
    user.save!

    redirect_to root_path
  end

  def save_update
    puts '---save!---'
    user = User.new(name:, email:)
    user.save!
    puts '---update!---'
    user.update!(name: name2)

    redirect_to root_path
  end
end

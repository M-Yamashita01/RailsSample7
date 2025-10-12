require 'rails_helper'

RSpec.describe User, type: :model do
  let(:name) { 'John Doe' }
  let(:name2) { 'John Doe2' }
  let(:email) { 'example@example.com' }

  describe 'create!' do
    it 'create user' do
      puts '---create!---'
      User.create!(name:, email:)
    end
  end

  describe 'save!' do
    it 'save user' do
      puts '---save!---'
      user = User.new(name:, email:)
      user.save!
    end

    context 'create! → save!' do
      it 'save user' do
        puts '---create!---'
        user = User.create!(name:, email:)
        puts '---save!---'
        # user = User.last
        user.name = name2
        user.save!
      end
    end

    context 'save! → save!' do
      it 'update user' do
        puts '---save!---'
        user = User.new(name:, email:)
        user.save!
        puts '---save!---'
        user.name = name2
        user.save!
      end
    end
  end

  describe 'update!' do
    context 'create! → update!' do
      it 'update user' do
        puts '---create!---'
        user = User.create!(name:, email:)
        puts '---update!---'
        user.update!(name: name2)
      end
    end

    context 'save! → update!' do
      it 'update user' do
        puts '---save!---'
        user = User.new(name:, email:)
        user.save!
        puts '---update!---'
        user.update!(name: name2)
      end
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:name) { 'John Doe' }
  let(:name2) { 'John Doe2' }
  let(:email) { 'example@example.com' }

  describe '#create' do
    it 'should create user' do
      puts '---create---'
      User.create(name:, email:)
    end

    context 'when user.save' do
      before do
        User.create(name:, email:)
      end

      it 'should update user' do
        puts '---create → save---'
        user = User.last
        user.name = name2
        user.save
      end
    end

    context 'when user.save!' do
      before do
        User.create(name:, email:)
      end

      it 'should update user' do
        puts '---create → save!---'
        user = User.last
        user.name = name2
        user.save!
      end
    end

    context 'when user.update' do
      before do
        User.create(name:, email:)
      end

      it 'should update user' do
        puts '---create → update---'
        user = User.last
        user.update(name: name2)
      end
    end

    context 'when user.update!' do
      before do
        User.create(name:, email:)
      end

      it 'should update user' do
        puts '---create → update!---'
        user = User.last
        user.update!(name: name2)
      end
    end
  end

  describe '#create!' do
    it 'should create user' do
      puts '---create!---'
      User.create!(name:, email:)
    end

    context 'when user.save' do
      before do
        User.create!(name:, email:)
      end

      it 'should update user' do
        puts '---create! → save---'
        user = User.last
        user.name = name2
        user.save
      end
    end

    context 'when user.save!' do
      before do
        User.create!(name:, email:)
      end

      it 'should update user' do
        puts '---create! → save!---'
        user = User.last
        user.name = name2
        user.save!
      end
    end

    context 'when user.update' do
      before do
        User.create!(name:, email:)
      end

      it 'should update user' do
        puts '---create! → update---'
        user = User.last
        user.update(name: name2)
      end
    end

    context 'when user.update!' do
      before do
        User.create!(name:, email:)
      end

      it 'should update user' do
        puts '---create! → update!---'
        user = User.last
        user.update!(name: name2)
      end
    end
  end

  describe '#save' do
    it 'should save user' do
      puts '---save---'
      user = User.new(name:, email:)
      user.save
    end

    context 'when user.save' do
      before do
        user = User.new(name:, email:)
        user.save
      end

      it 'should update user' do
        puts '---save → save---'
        user = User.last
        user.name = name2
        user.save
      end
    end

    context 'when user.save!' do
      before do
        user = User.new(name:, email:)
        user.save
      end

      it 'should update user' do
        puts '---save → save!---'
        user = User.last
        user.name = name2
        user.save!
      end
    end

    context 'when user.update' do
      before do
        user = User.new(name:, email:)
        user.save
      end
      it 'should update user' do
        puts '---save → update---'
        user = User.last
        user.update(name: name2)
      end
    end

    context 'when user.update!' do
      before do
        user = User.new(name:, email:)
        user.save
      end

      it 'should update user' do
        puts '---save → update!---'
        user = User.last
        user.update!(name: name2)
      end
    end
  end

  describe '#save!' do
    it 'should save user' do
      puts '---save!---'
      user = User.new(name:, email:)
      user.save!
    end

    context 'when user.save' do
      before do
        user = User.new(name:, email:)
        user.save!
      end

      it 'should update user' do
        puts '---save! → save---'
        user = User.last
        user.name = name2
        user.save
      end
    end

    context 'when user.save!' do
      before do
        user = User.new(name:, email:)
        user.save!
      end

      it 'should update user' do
        puts '---save! → save!---'
        user = User.last
        user.name = name2
        user.save!
      end
    end

    context 'when user.update' do
      before do
        user = User.new(name:, email:)
        user.save!
      end

      it 'should update user' do
        puts '---save! → update---'
        user = User.last
        user.update(name: name2)
      end
    end

    context 'when user.update!' do
      before do
        user = User.new(name:, email:)
        user.save!
      end

      it 'should update user' do
        puts '---save! → update!---'
        user = User.last
        user.update!(name: name2)
      end
    end
  end
end

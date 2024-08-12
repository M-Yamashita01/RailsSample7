class User < ApplicationRecord
  before_validation :puts_before_validation
  after_validation :puts_after_validation
  before_create :puts_before_create
  before_save :puts_before_save
  before_update :puts_before_update
  around_create :puts_around_create
  around_save :puts_around_save
  around_update :puts_around_update
  after_commit :puts_after_commit
  after_create  :puts_after_create
  after_update  :puts_after_update
  after_save  :puts_after_save

  def puts_before_validation
    puts 'before_validation'
  end

  def puts_after_validation
    puts 'after_validation'
  end

  def puts_before_create
    puts 'before_create'
  end

  def puts_before_save
    puts 'before_save'
  end

  def puts_before_update
    puts 'before_update'
  end

  def puts_around_create
    puts 'around_create'
    yield
  end

  def puts_around_save
    puts 'around_save'
    yield
  end

  def puts_around_update
    puts 'around_update'
    yield
  end

  def puts_after_commit
    puts 'after_commit'
  end

  def puts_after_create
    puts 'after_create'
  end

  def puts_after_save
    puts 'after_save'
  end

  def puts_after_update
    puts 'after_update'
  end
end

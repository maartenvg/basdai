class User < ActiveRecord::Base
  attr_accessible :email, :name, :birthdate, :gender, :password, :password_confirmation

  validates_uniqueness_of :name
  validates_presence_of :email, :birthdate
  validates_inclusion_of :gender, in: ['m', 'f']

  has_secure_password
  
  has_many :questionnaires, dependent: :destroy
  
  def to_s
    name
  end

  def print_gender
    gender == 'm'  ? 'Male' : 'Female'
  end

  def age
    now = Time.now
    now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1)
  end
end

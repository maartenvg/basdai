class User < ActiveRecord::Base
  attr_accessible :email, :name, :birthdate, :gender, :password, :password_confirmation
  
  validates_uniqueness_of :name
  validates_presence_of :email, :birthdate
  validates_inclusion_of :gender, in: ['m', 'f']
  
  has_secure_password

  def to_s 
    @name
  end
  
  def age
    now = Time.now.to_date
    now.year - @birthdate.year - ((now.month > @birthdate.month || (now.month == @birthdate.month && now.day >= @birthdate.day)) ? 0 : 1)
  end
end

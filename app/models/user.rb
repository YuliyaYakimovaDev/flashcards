class User < ActiveRecord::Base

  attr_accessor :salt, :crypted_password

  has_many :cards, :dependent => :destroy

  authenticates_with_sorcery!

  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
end

class Author < ActiveRecord::Base
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "should match confirmation" if :password
  validates :username, presence: false
  validates :email, presence: false
  validates :crypted_password, presence: false
  validates :salt, presence: false

end

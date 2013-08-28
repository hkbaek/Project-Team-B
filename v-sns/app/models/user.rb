class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  belongs_to :role
  before_create :set_default_role
  has_many :posts
	has_many :comments
  
  devise :database_authenticatable, :registerable, :confirmable,
  :recoverable, :rememberable, :trackable, :validatable

  private
  def set_default_role
  	self.role ||= Role.find_by_name('registerd')
  end
end

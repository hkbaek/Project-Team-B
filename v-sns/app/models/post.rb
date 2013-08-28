class Post < ActiveRecord::Base
	# 유저가 지워지면 게시물도 다 같이 지워진다.
  belongs_to :user
  
  has_many :comments, :dependent => :destroy

	# accepts_nested_attributes_for :tags, :allow_destroy => :true,
  #   :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  mount_uploader :image, ImageUploader  
end

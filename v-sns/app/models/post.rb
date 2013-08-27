class Post < ActiveRecord::Base
	# 유저가 지워지면 게시물도 다 같이 지워진다.
  belongs_to :user

  mount_uploader :image, ImageUploader  
end

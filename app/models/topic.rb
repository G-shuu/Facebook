class Topic < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  validates :content, presence: true

  belongs_to :user

  has_many :comments, dependent: :destroy
end

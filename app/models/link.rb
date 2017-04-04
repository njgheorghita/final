class Link < ActiveRecord::Base
  validates :url, :title, presence: true
  validates :url, :url => true
  belongs_to :user
end

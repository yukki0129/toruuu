class Article
  include Mongoid::Document

  

  field :title, type: String
  field :video, type: String

  mount_uploader :video, VideoUploader
  validates :title, :video, :presence => true
end

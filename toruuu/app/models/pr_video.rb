class PrVideo < ActiveRecord::Base
	mount_uploader :video, PrVideoUploader

	validates :title, :video, :presence => true
end

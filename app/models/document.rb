class Document < ApplicationRecord
	has_one_attached :file
	validates :file, presence: true
	validates :title, presence: true
end

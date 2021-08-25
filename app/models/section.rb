class Section < ApplicationRecord
	has_many :videos, :dependent => :destroy
end

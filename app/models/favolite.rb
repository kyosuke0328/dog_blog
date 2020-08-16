class Favolite < ApplicationRecord
	belongs_to :member
	belongs_to :photo
	belongs_to :blog
end

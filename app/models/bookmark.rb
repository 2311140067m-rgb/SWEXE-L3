class Bookmark < ApplicationRecord
    validates :title, :url ,:author, presence: true
    validates :title, length: { maximum: 20 }
end

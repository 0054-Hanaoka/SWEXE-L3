class Bookmark < ApplicationRecord
    validates :url, length: { minimum: 2 }
end
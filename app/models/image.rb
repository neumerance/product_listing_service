class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  has_one_attached :file
  validates :file, presence: false, blob: {
              content_type: ['image/png', 'image/jpg', 'image/jpeg'],
              size_range: 1..5.megabytes
            }
end

class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  validates :file, presence: false, blob: {
              content_type: ['image/png', 'image/jpg', 'image/jpeg'],
              size_range: 1..5.megabytes
            }
end

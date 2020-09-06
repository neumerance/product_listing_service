include Rails.application.routes.url_helpers

class ImageSerializer
  include FastJsonapi::ObjectSerializer

  attribute :large do |image|
    Rails.application.routes.url_helpers.rails_representation_url(
      image.file.variant(resize: '420x420').processed,
      only_path: true
    )
  end

  attribute :thumbnail do |image|
    Rails.application.routes.url_helpers.rails_representation_url(
      image.file.variant(resize: '140x140').processed,
      only_path: true
    )
  end
end

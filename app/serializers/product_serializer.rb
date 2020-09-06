class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :price

  attribute :images do |product|
    ::ImageSerializer.new(product.images).
      serializable_hash.dig(:data).map do |image|
        image.dig(:attributes)
      end
  end
end

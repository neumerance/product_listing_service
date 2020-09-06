require 'rails_helper'

describe ProductSerializer do
  subject do
    described_class.new(product).
      serializable_hash.dig(:data, :attributes)
  end

  let(:product) { create(:product) }
  let(:expectation) do
    {
      name: product.name,
      description: product.description,
      price: product.price,
      images: []
    }
  end

  it { is_expected.to eq expectation }
end

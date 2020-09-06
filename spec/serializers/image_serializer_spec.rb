require 'rails_helper'

describe ImageSerializer do
  subject do
    described_class.new(image).serializable_hash
  end

  let(:image) { create(:image) }
  let(:attributes) { subject.dig(:data, :attributes).keys }

  it 'serialise image' do
    expect(attributes).to include(:thumbnail)
    expect(attributes).to include(:large)
  end
end

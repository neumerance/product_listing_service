require 'rails_helper'

describe Shop, type: :model do
  context 'validates uniqueness' do
    subject { build(:shop) }

    it { is_expected.to validate_uniqueness_of :name }
  end

  it { is_expected.to validate_presence_of :business_phone_number }
  it { is_expected.to validate_presence_of :order_forwarding_number }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :tags }
  it { is_expected.to validate_presence_of :business_openning_time }
  it { is_expected.to validate_presence_of :business_closing_time }
  it { is_expected.to have_many :products }
  it { is_expected.to belong_to :user }
end

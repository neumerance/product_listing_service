require 'rails_helper'

describe Shop, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :tags }
  it { should validate_presence_of :order_forwarding_number }
  it { should validate_presence_of :business_phone_number }
  it { should validate_presence_of :business_openning_time }
  it { should validate_presence_of :business_closing_time }
  it { should have_many :products }
  it { should belong_to :user }
end

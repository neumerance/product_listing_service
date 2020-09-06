include ActionDispatch::TestProcess

FactoryBot.define do
  factory :image do
    file do
      fixture_file_upload(
        Rails.root.join(
          'spec', 'fixtures',
          'images', 'chicken.jpg'
        ), 'image/jpg'
      )
    end
    imageable { create(:product) }
  end
end

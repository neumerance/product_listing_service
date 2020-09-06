# resets shop
User.all.destroy_all
Shop.all.destroy_all

# creates bunch of shops with products
FactoryBot.create_list(:shop, 5, :with_products)

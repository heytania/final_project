require "net/http"
require "json"

# Define the API endpoint
api = "https://fakestoreapi.com/products"

# Parse the API response and retrieve products
uri = URI(api)
response = Net::HTTP.get(uri)
products = JSON.parse(response)

# Clear existing data
Product.destroy_all
Category.destroy_all

# Iterate through each product and create records in the database
products.each do |product|
  # Find or create a category based on the product's category
  category = Category.find_or_create_by(name: product["category"])

  # Create a new product record
  Product.create!(
    brand: product["title"], # Assuming "title" represents brand in the FakeStoreAPI
    name: product["title"],
    description: product["description"],
    price: product["price"],
    image: product["image"],
    category: category
  )
end


# Define province data
provinces_data = [
  { name: 'Alberta', gst: nil, pst: nil, hst: 0.05 },
  { name: 'British Columbia', gst: 0.05, pst: 0.07, hst: nil },
  { name: 'Manitoba', gst: 0.05, pst: 0.07, hst: nil },
  { name: 'New Brunswick', gst: nil, pst: nil, hst: 0.15 },
  { name: 'Newfoundland and Labrador', gst: nil, pst: nil, hst: 0.15 },
  { name: 'Northwest Territories', gst: nil, pst: nil, hst: 0.05 },
  { name: 'Nova Scotia', gst: nil, pst: nil, hst: 0.15 },
  { name: 'Nunavut', gst: nil, pst: nil, hst: 0.05 },
  { name: 'Ontario', gst: nil, pst: nil, hst: 0.13 },
  { name: 'Prince Edward Island', gst: nil, pst: nil, hst: 0.15 },
  { name: 'Quebec', gst: 0.05, pst: 0.09975, hst: nil },
  { name: 'Saskatchewan', gst: 0.05, pst: 0.06, hst: nil },
  { name: 'Yukon', gst: nil, pst: nil, hst: 0.05 }
]

# Create provinces
provinces.each do |province_data|
  Province.find_or_create_by(province_data)
end
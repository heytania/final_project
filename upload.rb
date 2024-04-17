require "net/http"
require "json"
require "stripe"
Stripe.api_key = "sk_test_51MtE9gIHcd0PyhICoaOpV3wMHbEYLwa2S9IMFC8t1dKEBS94EHhMGWRN4m27PJ2ANwAapNrWjpvLlQ5YvyoB4QNQ00ZFirlM2Z"

api = "http://makeup-api.herokuapp.com/api/v1/products.json"
uri = URI(api)
response = Net::HTTP.get(uri)
products = JSON.parse(response)

products.map do |product|
  stripe_product = Stripe::Product.create(
    images: [product["image_link"]],
    name: product["name"],
    metadata: {
      brand: product["brand"],
      id: product["id"]
    }
  )
  Stripe::Price.create(
    unit_amount: product["price"].to_i*100,
    currency: "cad",
    product: stripe_product.id,
    lookup_key: product["id"]
  )
end
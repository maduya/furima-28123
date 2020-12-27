FactoryBot.define do
  factory :shop do
    product_name            {"あか"}
    product_description     {"あか"}
    genre_id                {3}
    prefecture_id           {3}
    sales_status_id         {3}
    shipping_fee_status_id  {3}
    scheduled_delivery_id   {3}
    price                   {300}
  end
end
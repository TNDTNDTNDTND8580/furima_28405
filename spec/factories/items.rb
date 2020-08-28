FactoryBot.define do
  factory :item do
    item                   {"オムレツ"}
    introduce              {"ケチャップ付き"}
    category_id            {1}
    condition_id           {1}
    delivery_fee_id        {1}
    area_id                {1}
    days_until_shipping_id {1}
    price                  {500}
    association :user
  end

end

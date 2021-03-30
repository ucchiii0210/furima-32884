FactoryBot.define do
  factory :purchase_order do
    postal      {"111-1111"}
    area_id     {10}
    city        {"川崎市"}
    address     {"川崎区"}
    property    {"日の出"}
    tell        {"09052842409"}
    token       {"tok_480a3461802d34b78a01491f1274"}
    user_id     {1}
    item_id     {1}
  end
end

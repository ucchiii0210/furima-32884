FactoryBot.define do
  factory :item do
    product        {Faker::Lorem.sentence}
    text           {Faker::Lorem.sentence}
    category_id    {2}
    status_id      {2}
    sipping_id     {2}
    area_id        {2}
    day_id         {2}
    price          {300}
    after(:build) do |post|
      post.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png', content_type: 'image/png')
    end
    association :user
  end
end

FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 100)
    password              {password}
    password_confirmation {password}
    first_name            {'てすと'}
    last_name             {'てすと'}
    first_name_kana       {'テスト'}
    last_name_kana        {'テスト'}
    birthday              { Faker::Date.backward }
  end
end

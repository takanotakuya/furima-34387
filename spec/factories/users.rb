FactoryBot.define do
  factory :user do
    nickname { 'tanaka田中たなかタナカ0' }
    email { Faker::Internet.free_email }
    password { '111aaa' }
    password_confirmation { password }
    first_name { '田中たなかタナカ' }
    second_name { '田中たなかタナカ' }
    first_name_kana { 'タナカ' }
    second_name_kana { 'タナカ' }
    birthday { '1994-09-21' }
  end
end

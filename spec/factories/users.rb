FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000a"}
    password_confirmation {password}
    first_name_kanji      {"田中"}
    last_name_kanji       {"太郎"}
    first_name_kana       {"タナカ"}
    last_name_kana        {"タロウ"}
    birthday              {"1999/10/10"}
  end
end
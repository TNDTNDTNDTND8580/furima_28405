FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    familyname            {"頓田"}
    firstname             {"翔太"}
    phonetic_familyname   {"トンダ"}
    phonetic_firstname    {"ショウタ"}
    birthday              {"1992/5/26"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {password}
  end
end
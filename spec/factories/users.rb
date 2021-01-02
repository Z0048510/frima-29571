FactoryBot.define do
  factory :user do
    dummyname = Gimei.name
    nickname                  { Faker::Name.initials(number: 6) }
    firstname                 { dummyname.first.kanji }
    familyname                { dummyname.last.kanji }
    firstnameasc              { dummyname.first.katakana }
    familynameasc             { dummyname.last.katakana }
    birthday                  { Faker::Date.between(from: '1930-01-01', to: 5.years.ago) }
    email                     { Faker::Internet.free_email }
    password                  { Faker::Internet.password(min_length: 6) }
    password_confirmation     { password }
  end
end

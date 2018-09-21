FactoryBot.define do
  factory :message do
    body "MyText"
    read false
    conversation nil
    image "MyString"
    file "MyString"
    messageable nil
  end
end

FactoryBot.define do
  factory :advertise do
    advertisable_type "MyText"
    cover "MyString"
    images "MyText"
    status "MyString"
    creator_id 1
    seen_count ""
    clicked_count "MyText"
    budget 1.5
  end
end

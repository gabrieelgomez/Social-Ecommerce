FactoryBot.define do
  factory :transaction do
    amount 1.5
    reference "MyText"
    type ""
    status "MyString"
    coin nil
    user nil
    wallet nil
  end
end

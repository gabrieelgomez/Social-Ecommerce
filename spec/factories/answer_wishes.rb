FactoryBot.define do
  factory :answer_wish do
    profile nil
    sended_wish nil
    message "MyText"
    special_price 1.5
    limit_date "2018-05-25 16:44:03"
    claim_code "MyString"
    special_conditions "MyText"
  end
end

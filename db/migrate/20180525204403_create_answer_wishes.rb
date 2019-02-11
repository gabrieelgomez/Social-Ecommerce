class CreateAnswerWishes < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_wishes do |t|
      t.references :profile, foreign_key: true
      t.references :sended_wish, foreign_key: true
      t.text       :message
      t.float      :special_price
      t.datetime   :limit_date
      t.string     :claim_code
      t.text       :special_conditions

      t.timestamps
    end
  end
end

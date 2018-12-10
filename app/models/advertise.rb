class Advertise < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, class_name: 'User'


  def add_user_click(user_id, time)
    clicked_count.push(
      {
        user_id: user_id,
        click_time: time
      }
    )
    save!
  end

  def increase_seen_count
    self.seen_count += 1
    save!
  end
end

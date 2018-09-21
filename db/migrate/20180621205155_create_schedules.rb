class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.jsonb :monday,    default:  {open: '8:00am', close: '5:00pm'}
      t.jsonb :tuesday,   default:  {open: '8:00am', close: '5:00pm'}
      t.jsonb :wednesday, default:  {open: '8:00am', close: '5:00pm'}
      t.jsonb :thursday,  default:  {open: '8:00am', close: '5:00pm'}
      t.jsonb :friday,    default:  {open: '8:00am', close: '5:00pm'}
      t.jsonb :saturday,  default:  {open: '8:00am', close: '5:00pm'}
      t.jsonb :sunday,    default:  {open: '8:00am', close: '5:00pm'}
      t.integer :profile_id
      t.timestamps
    end
  end
end

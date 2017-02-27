class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.boolean :active, default: true
      t.string :slug
      t.integer :standup_start_hour, default: 8
      t.integer :standup_start_minute, default: 0
      t.integer :standup_end_hour, default: 10
      t.integer :standup_end_minute, default: 0
      t.string :question_a, default: 'What did you do yesterday?What did you do yesterday?'
      t.string :question_b, default: 'What will you do today?'
      t.string :question_c, default: 'Are there any impediments in your way?'

      t.timestamps
    end
  end
end

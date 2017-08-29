class CreateDays < ActiveRecord::Migration[5.0]
  def change
    create_table :days do |t|
      t.references :team
      t.timestamp :today
      t.timestamp :question_sent
      t.timestamp :response_sent

      t.timestamps
    end
  end
end

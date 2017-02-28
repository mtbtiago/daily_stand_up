class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.references :team
      t.references :day
      t.references :user
      t.string :slug
      t.string :response_a
      t.string :response_b
      t.string :response_c
      t.boolean :user_has_responded, default: false

      t.timestamps
    end
  end
end

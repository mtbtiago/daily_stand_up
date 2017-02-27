class AddSlugIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :teams, :slug, unique: true
    add_index :responses, :slug, unique: true
  end
end

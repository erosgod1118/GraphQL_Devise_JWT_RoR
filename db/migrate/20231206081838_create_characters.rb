class CreateCharacters < ActiveRecord::Migration[7.1]
  def change
    create_table :characters, force: :cascade do |t|
      t.string "name"
      t.integer "strength"
      t.integer "dexterity"
      t.integer "intelligence"
      t.integer "charisma"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.integer "player_id", null: false

      #index
      t.index ["player_id"], name: "index_characters_on_player_id"
    end
  end
end

class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players, force: :cascade do |t|
      t.string "user_name"
      t.string "display_name"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end

class AddForeignKeyToCharacters < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key "characters", "players", column: :player_id, primary_key: :id
  end
end

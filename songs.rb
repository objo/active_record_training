require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  "sqlite3",
  database: "db/song_list.sqlite"
)

class CreateSongsMigration < ActiveRecord::Migration
  def change
    create_table :songs do |table|
      table.string :name
      table.integer :runtime
    end
  end
end

CreateSongsMigration.migrate(:up)

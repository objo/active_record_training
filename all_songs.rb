require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database  => "db/song_list.sqlite"
)

class CreateSongsMigration < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :runtime
    end
  end
end

CreateSongsMigration.migrate(:down)
CreateSongsMigration.migrate(:up)

class Song < ActiveRecord::Base; end

Song.create!({title: "Allentown", runtime: 330 })

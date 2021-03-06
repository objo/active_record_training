require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  "sqlite3",
  database: "db/song_list.sqlite"
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

class CreateSongsMigration < ActiveRecord::Migration[4.2]
  def change
    create_table :songs do |table|
      table.string :name
      table.integer :runtime
    end
  end
end

CreateSongsMigration.migrate(:down)
CreateSongsMigration.migrate(:up)


class Song < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :runtime, numericality: true
  validates :runtime, numericality: { greater_than: 10 }
end

Song.create!({ name: "Allentown", runtime: 432 })
Song.create!({ name: "Uptown Girl", runtime: 654 })
Song.create!({ name: "Goodnight Saigon", runtime: 200 })

song = Song.new
song.name = "Honesty"
song.runtime = 454
song.save

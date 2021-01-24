class CreateContactTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_tracks do |t|
      t.belongs_to :contact, foreign_key: true

      t.timestamps
    end
  end
end

class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :video_link
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end

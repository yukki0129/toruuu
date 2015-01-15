class CreatePrVideos < ActiveRecord::Migration
  def change
    create_table :pr_videos do |t|
      t.string :title
      t.string :video
      t.string :description

      t.timestamps
    end
  end
end

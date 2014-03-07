class CreateMentions < ActiveRecord::Migration
  def change
    create_table :mentions do |t|
      t.integer :post_id
      t.integer :topic_id

      t.timestamps
    end
  end
end

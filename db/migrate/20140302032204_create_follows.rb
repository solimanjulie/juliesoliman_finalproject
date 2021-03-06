class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :follower_id
      t.integer :leader_id

      t.timestamps
    end

    add_index :follows, :follower_id
    add_index :follows, :leader_id
    add_index :follows, [:follower_id, :leader_id], unique: true
  end
end

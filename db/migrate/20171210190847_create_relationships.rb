class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :followships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :followships, :follower_id
    add_index :followships, :followed_id
    # how to actually join the tables together
    add_index :followships, [:follower_id, :followed_id], unique: true
  end
end

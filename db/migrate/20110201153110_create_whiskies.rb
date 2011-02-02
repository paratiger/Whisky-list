class CreateWhiskies < ActiveRecord::Migration
  def self.up
    create_table :whiskies do |t|
      t.string :title, :null => false
      t.text :body
      t.integer :rating
      t.string :image_url
      t.string :url
      t.integer :distillery_id
      t.timestamps
    end
    add_index :whiskies, :rating
    add_index :whiskies, :distillery_id
  end

  def self.down
    drop_table :whiskies
  end
end

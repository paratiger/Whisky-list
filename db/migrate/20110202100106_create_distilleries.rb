class CreateDistilleries < ActiveRecord::Migration
  def self.up
    create_table :distilleries do |t|
      t.string :title
      t.float :lat
      t.float :lng
      t.string :url
      t.timestamps
    end
    add_index :distilleries, :title
  end

  def self.down
    drop_table :distilleries
  end
end

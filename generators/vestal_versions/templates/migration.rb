class CreateVestalVersions < ActiveRecord::Migration
  def self.up
    create_table :versions do |t|
      t.belongs_to :versioned, :polymorphic => true
      t.belongs_to :user, :polymorphic => true
      t.string :user_name
      t.text :modifications
      t.integer :number
      t.string :tag

      t.timestamps
      t.datetime :deleted_at
    end

    change_table :versions do |t|
      t.index [:versioned_id, :versioned_type, :deleted_at]
      t.index [:user_id, :user_type, :deleted_at]
      t.index [:user_name, :deleted_at]
      t.index [:number, :deleted_at]
      t.index [:tag, :deleted_at]
      t.index [:created_at, :deleted_at]
    end
  end

  def self.down
    drop_table :versions
  end
end

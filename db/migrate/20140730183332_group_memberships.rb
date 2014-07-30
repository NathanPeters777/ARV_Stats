class GroupMemberships < ActiveRecord::Migration
  def self.up
    create_table :group_memberships do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :group_id
      t.integer  :user_id
    end
    add_index :group_memberships, [:group_id]
    add_index :group_memberships, [:user_id]
  end

  def self.down
    drop_table :group_memberships
  end
end

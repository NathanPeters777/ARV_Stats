class ModelOwnerships < ActiveRecord::Migration
  def self.up
    add_column :groups, :owner_id, :integer

    add_column :targets, :owner_id, :integer

    add_column :trials, :owner_id, :integer

    add_index :groups, [:owner_id]

    add_index :targets, [:owner_id]

    add_index :trials, [:owner_id]
  end

  def self.down
    remove_column :groups, :owner_id

    remove_column :targets, :owner_id

    remove_column :trials, :owner_id

    remove_index :groups, :name => :index_groups_on_owner_id rescue ActiveRecord::StatementInvalid

    remove_index :targets, :name => :index_targets_on_owner_id rescue ActiveRecord::StatementInvalid

    remove_index :trials, :name => :index_trials_on_owner_id rescue ActiveRecord::StatementInvalid
  end
end

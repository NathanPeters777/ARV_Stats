class InitialModels < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string   :name
      t.text     :description
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :targets do |t|
      t.string   :description
      t.string   :outcome1
      t.string   :outcome2
      t.string   :final_outcome
      t.string   :group_prediction
      t.float    :confidence_level
      t.float    :cr_divergence
      t.float    :trials_cr_delta_mean
      t.float    :trials_cr_delta_stddev
      t.string   :trials_cr_delta_snr
      t.float    :trials_zscore
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :group_id
    end
    add_index :targets, [:group_id]

    create_table :trials do |t|
      t.string   :trn1
      t.string   :trn2
      t.float    :cr1
      t.float    :cr2
      t.integer  :solar_wind_speed
      t.datetime :viewer_local_time
      t.datetime :lst_time
      t.string   :user_prediction
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :target_id
      t.integer  :user_id
    end
    add_index :trials, [:target_id]
    add_index :trials, [:user_id]

    add_column :users, :projectmanager, :boolean, :default => false
  end

  def self.down
    remove_column :users, :projectmanager

    drop_table :groups
    drop_table :targets
    drop_table :trials
  end
end

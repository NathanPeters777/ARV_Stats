class TargetNameDueCue < ActiveRecord::Migration
  def self.up
    add_column :targets, :name, :string
    add_column :targets, :due_date, :date
    add_column :targets, :prompt_or_cue, :text
    remove_column :targets, :description
  end

  def self.down
    remove_column :targets, :name
    remove_column :targets, :due_date
    remove_column :targets, :prompt_or_cue
    add_column :targets, :description, :string
  end
end

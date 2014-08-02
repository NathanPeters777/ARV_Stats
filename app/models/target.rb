class Target < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name                   :string
    due_date               :date
    prompt_or_cue          :text
    outcome1               :string
    outcome2               :string
    final_outcome          :string
    group_prediction       :string
    confidence_level       :float
    cr_divergence          :float
    trials_cr_delta_mean   :float
    trials_cr_delta_stddev :float
    trials_cr_delta_snr    :string
    trials_zscore          :float
    timestamps
  end
  attr_accessible :name, :due_date, :prompt_or_cue, :outcome1, :outcome2, :final_outcome, :group_prediction, :confidence_level, :cr_divergence, :trials_cr_delta_mean, :trials_cr_delta_stddev, :trials_cr_delta_snr, :trials_zscore

  belongs_to :owner, :class_name => "User", :creator => true, :inverse_of => :targets

  belongs_to :group, :inverse_of => :targets

  has_many :trials, :dependent => :destroy, :inverse_of => :target

  children :trials

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator? || acting_user == group.owner
  end

  def update_permitted?
    acting_user.administrator? || acting_user == group.owner
  end

  def destroy_permitted?
    acting_user.administrator? || acting_user == group.owner
  end

  def view_permitted?(field)
    true
  end

end

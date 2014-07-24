class Target < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    description            :string
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
  attr_accessible :description, :outcome1, :outcome2, :final_outcome, :group_prediction, :confidence_level, :cr_divergence, :trials_cr_delta_mean, :trials_cr_delta_stddev, :trials_cr_delta_snr, :trials_zscore

  belongs_to :group, :inverse_of => :targets

  has_many :trials, :dependent => :destroy, :inverse_of => :target

  children :trials

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end

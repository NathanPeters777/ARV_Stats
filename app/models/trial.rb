class Trial < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    trn1              :string
    trn2              :string
    cr1               :float
    cr2               :float
    solar_wind_speed  :integer
    viewer_local_time :datetime
    lst_time          :datetime
    user_prediction   :string
    timestamps
  end
  attr_accessible :trn1, :trn2, :cr1, :cr2, :solar_wind_speed, :viewer_local_time, :lst_time, :user_prediction

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

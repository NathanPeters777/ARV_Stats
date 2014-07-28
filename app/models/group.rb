class Group < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name        :string
    description :text
    timestamps
  end
  attr_accessible :name, :description

  belongs_to :owner, :class_name => "User", :creator => true, :inverse_of => :groups

  has_many :targets, :dependent => :destroy, :inverse_of => :group

  children :targets

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

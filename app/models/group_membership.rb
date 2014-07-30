class GroupMembership < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    timestamps
  end
  attr_accessible

  belongs_to :group, :inverse_of => :memberships
  belongs_to :user, :inverse_of => :group_memberships

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator? || group.creatable_by?(acting_user)
  end

  def update_permitted?
    acting_user.administrator? || group.creatable_by?(acting_user)
  end

  def destroy_permitted?
    acting_user.administrator? || group.creatable_by?(acting_user)
  end

  def view_permitted?(field)
    true
  end

end

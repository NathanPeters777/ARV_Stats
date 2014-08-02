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

  children :targets, :memberships

  has_many :memberships, :class_name => "GroupMembership", :dependent => :destroy, :inverse_of => :group
  has_many :members, :through => :memberships, :source => :user

  # --- Permissions --- #

  def create_permitted?
    acting_user.projectmanager == true || acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator? || owner_is?(acting_user)
  end

  def destroy_permitted?
    acting_user.administrator? || owner_is?(acting_user)
  end

  def view_permitted?(field)
    true
  end

end

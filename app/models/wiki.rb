class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  scope :visible_to, -> (user) { user && (user.premium? || user.admin?) ? all : where(private: false)  }
  scope :publicly_visible, -> {where(private: false)}

  def set_default_privacy
    self.private ||= false
  end
end

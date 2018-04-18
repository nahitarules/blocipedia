class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :users
  scope :visible_to, -> (user) { user && (user.premium? || user.admin?) ? all : where(public: true)  }
  scope :publicly_visible, -> {where(public: true)}
  end

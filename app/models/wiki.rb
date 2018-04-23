class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborator
  has_many :users, through: :collaborator
  scope :visible_to, -> (user) { user && (user.premium? || user.admin?) ? all : where(public: true)  }
  scope :publicly_visible, -> {where(public: true)}
  end

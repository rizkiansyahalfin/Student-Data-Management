class Menu < ApplicationRecord
  # validates :menu_name, :menu_route, :created_by, presence: true
  validates_presence_of :menu_name, :menu_route
  has_many :menu_permissions, dependent: :delete_all
end

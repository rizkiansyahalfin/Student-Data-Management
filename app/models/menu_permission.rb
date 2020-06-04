class MenuPermission < ApplicationRecord
  belongs_to :menu
  belongs_to :user
  # validates :menu_id, :user_id :create, :read, :uptodate, :remove, presence: true
  # validates_presence_of :menu_id, :user_id :create, :read, :uptodate, :remove
  after_destroy :log_destroy_action
 
  def log_destroy_action
    puts 'Menu Permission destroyed'
  end

end

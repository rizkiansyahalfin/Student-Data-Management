class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception

  before_action :authenticate_user!
  before_action :check_menu_permission!

  private

  def check_menu_permission!
    return unless user_signed_in?
    
    # Allow dev / devise controllers and root dashboard
    return if devise_controller?
    return if controller_name == 'menus' && action_name == 'index'

    # Find menu by current controller_name
    menu = Menu.find_by(menu_route: controller_name, is_active: [true, nil])
    return unless menu # If controller is not mapped in menus, allow access

    permission = current_user.menu_permissions.find_by(menu_id: menu.id)
    return unless permission # If user has no explicit permission set, treat as default allowed

    action_type = case action_name
                  when 'index', 'show' then :read
                  when 'new', 'create', 'import' then :create
                  when 'edit', 'update' then :uptodate
                  when 'destroy' then :remove
                  else :read
                  end

    unless permission.send(action_type)
      respond_to do |format|
        format.html { redirect_to root_path, alert: "Akses Ditolak: Anda tidak memiliki izin (#{action_type}) untuk menu ini." }
        format.json { render json: { error: "Access Denied" }, status: :forbidden }
      end
    end
  end

  def current_user_can?(menu_route, action_type)
    return true unless user_signed_in?
    menu = Menu.find_by(menu_route: menu_route.to_s)
    return true unless menu
    permission = current_user.menu_permissions.find_by(menu_id: menu.id)
    return true unless permission
    permission.send(action_type) == true
  end
  helper_method :current_user_can?
end

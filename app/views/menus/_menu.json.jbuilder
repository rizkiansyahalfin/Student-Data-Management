json.extract! menu, :id, :menu_name, :menu_route, :is_active, :created_by, :created_at, :updated_at
json.url menu_url(menu, format: :json)

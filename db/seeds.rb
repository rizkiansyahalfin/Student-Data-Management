# Initial Menu Seeds
default_menus = [
  { menu_name: "Siswa", menu_route: "/siswas", is_active: true },
  { menu_name: "Rombel", menu_route: "/rombels", is_active: true },
  { menu_name: "Rayon", menu_route: "/rayons", is_active: true },
  { menu_name: "Jurusan", menu_route: "/jurusans", is_active: true },
  { menu_name: "Menu", menu_route: "/menus", is_active: true },
  { menu_name: "Menu Permission", menu_route: "/menu_permissions", is_active: true }
]

default_menus.each do |menu_attrs|
  Menu.find_or_create_by!(menu_name: menu_attrs[:menu_name]) do |menu|
    menu.menu_route = menu_attrs[:menu_route]
    menu.is_active = menu_attrs[:is_active]
  end
end

puts "Default menus seeded successfully!"


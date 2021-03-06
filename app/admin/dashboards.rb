#encoding: utf-8
ActiveAdmin::Dashboards.build do

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.

  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  section "最近的商店" do
    table_for Shop.order("created_at desc").limit(10),i18n: Shop  do
      column :name do |shop|
        link_to shop.name, active_admin_shop_path(shop)
      end
      column :password_enabled
      column :guided
      column :deadline
      column :theme
      column :created_at
    end
    strong { link_to '查看所有商店', active_admin_shops_path }
    strong { link_to '查看系统状态', state_active_admin_shops_path }
  end

  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end

  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.

end

ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  # content title: proc{ I18n.t("active_admin.dashboard") } do
  #   div class: "blank_slate_container", id: "dashboard_default_message" do
  #     span class: "blank_slate" do
  #       span I18n.t("active_admin.dashboard_welcome.welcome")
  #       small I18n.t("active_admin.dashboard_welcome.call_to_action")
  #     end
  #   end

  content do

  panel "Recent products" do
    table_for Prod.order("created_at desc").limit(5) do
      column :name
      column :user
      column :created_at
    end
    strong { link_to "View All Products", admin_products_path }
  end

  panel "Your products" do
    table_for Prod.where(user: current_user) do
      column :name
      column :size
      column :prices do |product|
        product.prices.each do |price|
          columns price.value + " " + price.currency
        end
        nil
      end
      column :created_at
    end
    strong { link_to "View All Products", admin_products_path }
  end
  end
    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
# content
end

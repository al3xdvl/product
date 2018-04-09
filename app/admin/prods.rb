ActiveAdmin.register Prod, as: "Product" do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :size, :user_id, prices_attributes: [:id, :currency, :value, :product_id, :_edit, :_update, :_new, :_create]

index do
  selectable_column
  column :id
  column :name
  column :size
  column :prices do |product|
    product.prices.each do |price|
      columns price.value + " " + price.currency
    end
    nil
  end
  column :user
  actions
end

show title: :name do
    attributes_table do
      row :name
      row :size
      row :user
      row :created_at
      row :updated_at
      end
      nil
    panel 'Prices' do
      attributes_table_for product.prices do
        rows :value, :currency
      end
    end
end

form do |f|
    f.semantic_errors
    f.inputs do
      f.input :user
      f.input :name
      f.input :size
      # f.inputs "Other attributes" do
      #   f.has_many :meta do |attribute|
    end
    f.inputs "Prices" do
      f.has_many :prices do |price|
        price.input :value
        price.input :currency, :collection => ["dollars", "euros", "pounds"]
      end
    end
    f.actions
end

controller do
  # def new
  #   @product = Prod.new
  #   @product.prices.build
  # end

  def create
    @product = Prod.new(product_params)
    @product.user_id = current_user.id
    @product.save
    redirect_to admin_products_path
  end


private
  def product_params
      params.require(:prod).permit(:name, :size, prices_attributes: [:currency, :value, :prod_id])
  end
end



#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
end

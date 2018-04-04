ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :id, :email, :name, :created_at, :admin, :password, :password_confirmation, :first_name, :last_name

index do
    selectable_column
    column :name
    column :email
    column :created_at
    column :admin
    column :id
    actions
  end

show do
    attributes_table do
      row :first_name
      row :last_name
      row :email
      row :admin
      row :created_at
      row :updated_at
    end
end

form do |f|
  f.inputs "User" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
  f.inputs "Admin" do
    f.input :admin
  end
  f.actions
end

controller do
  def update
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end
    super
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

ActiveAdmin.register Registration do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :registration_no, :unique_id, :status, :vehicle_type
  #
  # or
  #
  # permit_params do
  #   permitted = [:registration_no, :unique_id, :status, :vehicle_type]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  actions :index, :show

  index do
    selectable_column
    id_column
    column :registration_no
    column :unique_id
    column :status
    actions
  end

  show do
    attributes_table do
      row :id
      row :registration_no
      row :unique_id
      row :status
      row :created_at
      row :updated_at
    end
  end

end

ActiveAdmin.register District do
  menu priority: 3
  permit_params :name, :address, :state, :pincode, :contact_person, :contact_number

  index do
    selectable_column
    id_column
    column :name
    column :state
    column :pincode
    actions
  end

  show do
    attributes_table do
      row :name
      row :address
      row :state
      row :pincode
      row :contact_person
      row :contact_number
    end

    panel "Schools in this District" do
      table_for district.schools do
        column :name
        column :address
        column("View") { |school| link_to "View School", admin_school_path(school) }
      end
    end
  end
end

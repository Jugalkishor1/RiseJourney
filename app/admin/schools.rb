ActiveAdmin.register School do
  menu priority: 4
  permit_params :district_id, :name, :address, :registration_no, :contact_person, :contact_number

  filter :name
  filter :district
  filter :buses_registration_no, as: :string
  index do
    selectable_column
    id_column
    column :name
    column :district
    column :registration_no
    actions
  end

  show do
    attributes_table do
      row :district
      row :name
      row :address
      row :registration_no
      row :contact_person
      row :contact_number
    end

    panel "Buses in this School" do
      table_for school.buses do
        column :registration_no
        column :capacity
        column("View") { |bus| link_to "View Bus", admin_bus_path(bus) }
      end
    end
  end
end

ActiveAdmin.register Bus do
  permit_params :school_id, :registration_no, :capacity, :status

  index do
    selectable_column
    id_column
    column :registration_no
    column :school
    column :capacity
    column :status
    actions
  end

  show do
    attributes_table do
      row :school
      row :registration_no
      row :capacity
      row :status
    end

    panel "Cameras in this Bus" do
      table_for bus.cameras do
        column :name
        column :location
        column("View Live") { |camera| link_to "View Camera", admin_camera_path(camera) }
      end
    end
  end
end

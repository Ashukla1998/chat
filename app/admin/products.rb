

ActiveAdmin.register Product do
  permit_params :name, :price, :description, :image

  
  menu 

  form do |f|
    f.inputs 'Product Details' do
      f.input :name
      f.input :price
      f.input :description
      f.input :image
    end
    f.actions
  end
end

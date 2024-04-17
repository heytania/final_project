ActiveAdmin.register Product do
  permit_params :brand, :name, :description, :price, :category, :image
end

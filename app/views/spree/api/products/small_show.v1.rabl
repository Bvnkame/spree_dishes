object @product
cache [I18n.locale, @current_user_roles.include?('admin'), current_currency, root_object]

attributes :id, :name, :dish_type_id, :dish_currency, :dish_price

node(:dish_type){ |p| p.dish_type.name if p.dish_type }

child(:variant_images => :images) { extends "spree/api/images/show" }
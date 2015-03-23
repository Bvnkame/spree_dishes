object @product
cache [I18n.locale, @current_user_roles.include?('admin'), current_currency, root_object]

attributes :id, :name, :date_delivery, :currency

node(:cost_price) { |p| p.dish_price.to_s }
node(:dish_type){ |p| p.dish_type.name if p.dish_type }

child(:images => :images) { extends "spree/api/images/show" }
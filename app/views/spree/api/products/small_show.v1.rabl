object @product
cache [I18n.locale, @current_user_roles.include?('admin'), current_currency, root_object]

attributes :id, :name, :cost_price, :currency
node(:dish_type){ |p| p.dish_type.name }

child(:images => :images) { extends "spree/api/images/show" }
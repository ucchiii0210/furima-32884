crumb :root do
  link "Home", root_path
end

crumb :user_new do 
  link "新規登録", new_user_registration_path
  parent :root
end

crumb :user_login do 
  link "ログイン", new_user_session_path
  parent :root
end

crumb :show do
  link "商品詳細", item_path(:id) 
  parent :root
end

crumb :edit do
  link "商品の編集", edit_item_path
  parent :show
end

crumb :new do
  link "商品の登録", new_item_path
  parent :root
end

crumb :orders_index do
  link "商品の購入", item_orders_path
  parent :show
end

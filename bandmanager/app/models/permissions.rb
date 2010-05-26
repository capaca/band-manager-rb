class Permissions < Aegis::Permissions
 
  role :admin
  role :user
 
  action :create_users do
    allow :admin
    deny :user
  end 
  
  resources :bands do
    allow :user, :admin
  end
end

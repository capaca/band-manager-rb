class Permissions < Aegis::Permissions
 
  role :admin
  role :user
 
  action :manage_users do
    allow :admin
    deny :user
  end 
  
  resources :users do
    allow :admin
    deny :user
  end
  
  resources :bands do
    allow :user, :admin
  end
  
end

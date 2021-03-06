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
  
  action :configurate do
    allow :admin
    deny :user
  end
  
  resources :configuration do
    allow :admin
    deny :user
  end
  
  resources :custom_style do
    allow :admin, :user
  end
  
  resources :bands do
    allow :user, :admin
  end
  
end

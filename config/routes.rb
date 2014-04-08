Xxw::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root :to => "main#index"
  resources :main do
    collection do
      post 'user_create'
      get 'check_login'
      get 'panoramic_campus'
      get 'school_activities'
      get 'transcript'
      get 'school_culture'
      get 'teacher_charisma'
      get 'at_query'
      get 'contact_us'
    end
  end
  # 新闻
  resources :school_news
  # 作品展示
  resources :works_show
  # 强制使用google浏览器
  resources :google_ie
  # 后台管理
  namespace :admin do
    match '' => 'accounts#index', :via => :get
    match '/login' => 'main#login', :via => :get
    match '/logout' => 'main#logout', :via => :get
    resources :main do
      collection do
        post 'check_login'
      end
    end
    resources :accounts do
      member do
        get 'password_reset'
      end
    end
    # 信息编辑
    resources :journalisms
    # 伦转图片
    resources :roll
    # 新闻
    resources :news
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

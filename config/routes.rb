Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: {
    sessions: 'admins/sessions'
  }, skip: [:registrations, :passwords, :confirmations, :unlocks]
  
  root 'news#index'
  get '/about_us', to: 'static_pages#about', as: 'about'
  get '/faq', to: 'static_pages#faq', as: 'faq'
  get '/contact', to: 'static_pages#contact', as: 'contact'

  namespace :admin do
    resources :abouts
    resources :faqs
    resources :news
  end
end

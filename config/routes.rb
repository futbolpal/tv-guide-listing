TvGuideListing::Application.routes.draw do
	resources :airings, :only => :index
	root to: "posts#index"
end

Rails.application.routes.draw do

  # Mount all the registered PushType Rails Engines. This should be placed
  # at the end of your routes.rb file to ensure your application routes are
  # not overidden by PushType.
  #
  # Overide the default mount points by passing a hash of options.
  # Example:
  #
  #   mount_push_type admin: 'cms', front_end: 'blog'
  #
  mount_push_type
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

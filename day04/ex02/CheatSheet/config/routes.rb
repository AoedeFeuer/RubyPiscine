Rails.application.routes.draw do
  root :to => "new_cheat_sheet#convention"

  get 'console' => 'new_cheat_sheet#console'
  get 'ruby' => 'new_cheat_sheet#ruby'
  get 'rails' => 'new_cheat_sheet#rails'
  get 'ruby_concepts' => 'new_cheat_sheet#ruby_concepts'
  get 'ruby_numbers' => 'new_cheat_sheet#ruby_numbers'
  get 'ruby_strings' => 'new_cheat_sheet#ruby_strings'
  get 'ruby_arrays' => 'new_cheat_sheet#ruby_arrays'
  get 'ruby_hashes' => 'new_cheat_sheet#ruby_hashes'
  get 'rails_folder_structure' => 'new_cheat_sheet#rails_folder_structure'
  get 'rails_commands' => 'new_cheat_sheet#rails_commands'
  get 'rails_erb' => 'new_cheat_sheet#rails_erb'
  get 'editor' => 'new_cheat_sheet#editor'
  get 'help' => 'new_cheat_sheet#help'
  get 'quick_search' => 'new_cheat_sheet#quick_search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

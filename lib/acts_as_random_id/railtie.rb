module ActsAsRandomId
  module Railtie < Rails::Railtie
    initializer 'acts_as_random_id.model_additions' do
      ActiveSupport.on_load :active_record do
        include ModelAdditions
      end
    end
  end
end
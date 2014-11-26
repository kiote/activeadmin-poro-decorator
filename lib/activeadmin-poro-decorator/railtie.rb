require 'activeadmin-poro-decorator'
require 'rails'
module ActiveAdminPoroDecorator
  class Railtie < Rails::Railtie
    railtie_name :activeadmin_poro_decorator

    rake_tasks do
      load "tasks/copy_config.rake"
    end
  end
end
require 'bootstrap_component/view_helpers'
module BootstrapComponent
  class Railtie < Rails::Railtie
    initializer "bootstrap_component.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end


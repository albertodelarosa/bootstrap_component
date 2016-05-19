module BootstrapComponent
  require "bootstrap_component/version"
  require 'action_view'
  require 'bootstrap_component/railtie' if defined?(Rails)
  require 'bootstrap_component/view_helpers'
end

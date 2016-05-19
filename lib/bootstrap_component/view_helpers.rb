module BootstrapComponent
  module ViewHelpers
    def well(opts = {}, &block)
      well = BS_Well.new(self, opts)
      well.process(&block)
    end
  end
end


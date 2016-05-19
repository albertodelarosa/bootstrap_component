module BootstrapComponent
  module ViewHelpers
    def well(opts = {}, &block)
      well = B_Well.new(self, opts)
      well.process(&block)
    end
  end
end


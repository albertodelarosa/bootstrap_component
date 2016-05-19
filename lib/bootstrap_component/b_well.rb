include ActionView::Helpers::TagHelper
include ActionView::Context


module BootstrapComponent
  # Your code goes here... I know huh... hehehe

  class B_Well
    include ViewHelpers
    include Utils

    def initialize(parent = self, opts={}, &block)
      @html = ""
      @opts = process_class_attribute(opts,"well")
      @html_char_entities = {'&lt;' => '<', "&gt;" => '>', "&quot;" => '"'}
    end

    def process(&block)
      @html += process_content("div", @opts) do
        if @opts.has_value?("well-")
          include_header(block)
        else
          check_block(&block)
        end
      end
      return process_html(@html)
    end

    def header(&block)
      return process_content( "div", {class: "caption"} ) do
        process_content( "div", {class: "h4"} ) do
          check_block(&block)
        end
      end
    end

    def img(opts={}, &block)
      opts = process_class_attribute(opts, "img")
      return process_content("img", opts ) do
        check_block(&block)
      end
    end

    def div(opts={}, content="", &block)
      opts = process_class_attribute(opts, content)
      return process_content("div", opts ) do
        check_block(&block)
      end
    end

    def p(opts={}, content="", &block)
      opts = process_class_attribute(opts, content)
      return process_content("p", opts ) do
        check_block(&block)
      end
    end

    def button(opts={}, content="", &block)
      opts = process_class_attribute(opts, content)
      return process_content("button", opts ) do
        check_block(&block)
      end
    end

  end

end

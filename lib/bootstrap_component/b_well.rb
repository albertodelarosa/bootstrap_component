include ActionView::Helpers::TagHelper
include ActionView::Context


module BootstrapComponent
  # Your code goes here... I know huh... hehehe

  class B_Well
    HTML_CHAR_ENTITIES = {'&lt;' => '<', "&gt;" => '>', "&quot;" => '"'}

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
      return process_html
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

    private


    def process_content(content = "div", opts = "", &block)
      return content_tag(content, opts){ check_block(&block) }
    end

    def process_class_attribute(opts, class_type)
      unless ( class_type.nil? ) || ( class_type.empty? )
        if opts.has_key?(:class)
          opts[:class] = class_type + " " + opts[:class].to_s
        else
          opts[:class] = class_type
        end
      end
      return opts
    end

    def check_block(&block)
      if block.nil?
        return ""
      else
        return block.call(self)
      end
    end

    def process_html
      check_html
      @html.html_safe
    end

    def check_html
      HTML_CHAR_ENTITIES.each{|key, value| @html.gsub!(key, value)}
    end

  end

end

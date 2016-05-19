module BootstrapComponent

  module ViewHelpers
    def well(opts = {}, &block)
      well = B_Well.new(self, opts)
      well.process(&block)
    end
  end

  module Utils
    HTML_CHAR_ENTITIES = {'&lt;' => '<', "&gt;" => '>', "&quot;" => '"'}

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

    def process_html(html)
      check_html(html)
      html.html_safe
      return html
    end

    def check_html(html)
      HTML_CHAR_ENTITIES.each{|key, value| html.gsub!(key, value)}
      return html
    end

  end

end


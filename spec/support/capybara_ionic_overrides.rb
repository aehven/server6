module Capybara
  module Node
    module Finders
      def find_button(text, options={})
        args = {text: text.upcase}
        args[:class] = options[:disabled] ? "button-disabled" : "!button-disabled"
        find("ion-button", args)
      end

      def find_field(name)
        find("ion-input[name='#{name.downcase}'] input")
      end
    end

    module Actions
      def fill_in(name, options={})
        find_field(name).set(options[:with])
      end

      def click_button(text)
        find_button(text).click
      end
    end
  end
end

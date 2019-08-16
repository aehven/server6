module Capybara
  module Node
    module Finders
      def find_button(text, options={})
        args = {text: text}
        args[:class] = options[:disabled] ? "button-disabled" : "!button-disabled"
        find("ion-button", args)
      end
    end

    module Actions
      def fill_in(name, options={})
        find_field(name: name.downcase).set(options[:with])
      end

      def click_button(text)
        find_button(text).click
      end
    end
  end
end

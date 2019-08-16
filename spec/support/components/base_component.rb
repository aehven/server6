class BaseComponent
  include Capybara::DSL

  def initialize(path=nil)
    @path = path
  end

  def h1
    find("#{@path} h1")
  end

  def h2
    find("#{@path} h2")
  end

  def h3
    find("#{@path} h3")
  end

  def tab_labels
    find_all(".mat-tab-label-content").map(&:text)
  end

  def tab_into(text)
    find(".mat-tab-label", text: text).click
  end

  def close_page
    # evaluate_script("window.close()")
    page.current_window.close
  end

  def checkbox(label)
    find("label", text: label)
  end

  def checkbox_value(label)
    checkbox(label).find("input").value
  end

  alias_method :radio, :checkbox
  alias_method :radio_value, :checkbox_value

  def datepicker(placeholder)
    find("mat-form-field", text: placeholder).find("mat-datepicker-toggle")
  end

  def set_datepicker(placeholder, date)
    datepicker(placeholder).click
    find(".mat-calendar-body-cell", text: date, exact_text: true).click
  end

  def edit
    click_on "Edit"
    sleep 1
  end

  def delete(accept_confirm=true, button_text="Delete")
    if(accept_confirm)
      page.accept_confirm "Are you sure?" do
        click_on button_text
      end
    else
      page.dismiss_confirm "Are you sure?" do
        click_on button_text
      end
    end
  end

  def disabled?
    !(find "form").find_all("input").map(&:disabled?).include?(false)
  end

  def cancel
    click_on "Cancel"
  end

  def submit
    click_on "Submit"
    sleep 1
  end

  ##### FIXME
  # if this method were extracted into each component, we'd use
  # define_method instead of define_singleton_method and the generated methods
  # would be instance methods.  Due to this extraction, had to do it this way,
  # making the form input methods class methods.  Didn't work otherwise.  Should
  # find a way to make it work.
  #####
  def form_inputs(array_of_field_names)
    array_of_field_names.each do |field|
      symbol_name = field.downcase.tr(" ", "_")

      define_singleton_method :"#{symbol_name}" do
        find("input[formcontrolname='#{symbol_name}']").value
      end

      define_singleton_method :"#{symbol_name}=" do |value|
        fill_in "#{field}", with: value
      end
    end
  end

  def form_selects(array_of_field_names)
    array_of_field_names.each do |field|
      symbol_name = field.downcase.tr(" ", "_")

      define_singleton_method :"#{symbol_name}" do
        find(".mat-select[formcontrolname=#{symbol_name}_id]").find(".mat-select-value").text
      end

      define_singleton_method :"#{symbol_name}=" do |value|
        find(".mat-select[formcontrolname=#{symbol_name}_id]").click
        find(".mat-option-text", text: value).click
      end
    end
  end

  def select_open(name)
    find("mat-select[formcontrolname='#{name}']").click
  end

  def select_close(name)
    find("mat-select[formcontrolname='#{name}']").send_keys(:escape)
  end

  def select_options(name)
    select_open(name)
    options = find_all(".mat-option-text").map(&:text)
    select_close(name)
    return options
  end

  def select_value(name)
    find("mat-select[formcontrolname='#{name}']").find(".mat-select-value").text
  end

  def set_select_value(name, value)
    select_open(name)
    find(".mat-option-text", text: value).click
  end

  def find_button(text, options={})
    args = {text: text}
    args[:class] = options[:disabled] ? "button-disabled" : "!button-disabled"
    find("ion-button", args)
  end

  def fill_in(name, options={})
    find_field(name: name.downcase).set(options[:with])
  end

  def click_button(text)
    find_button(text).click
  end
end

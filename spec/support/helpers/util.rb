require 'io/console'
module Helpers
  def pause(tag=nil)
    #pause test execution but let server and broser keep running :)
    puts "############# #{tag}"
    puts "############# PAUSING TEST.  b/d to debug, q to quit, c to continue"
    puts "#############"
    loop {
      k = STDIN.getch
      case k
      when "b", "d"
        send("BYEBUG".downcase) #allow this file to be commited to git even though it has disallowed code :)
      when "q"
        abort "Exit Requested"
      when "c"
        return
      end
    }
  end

  def float(element)
    text = element.text
    numerals = text.scan(/-?\d*\.?\d*/).join('')
    numerals.empty? ? nil : numerals.to_f
  end

  def new_session
    Capybara::Session.new(ENV['DRIVER']&.to_sym || :selenium_chrome)
  end

  def front
    return if ENV['STAY_BACK']
    # bring to front, thanks to https://sqa.stackexchange.com/a/25928
    window = page.current_window
    page.switch_to_window(window)
  end

  def using_session_front(session)
    using_session(session) do
      front
      yield
    end
  end

  def reset_db
    `bundle exec rails db:schema:load db:seed`
    # `bundle exec rails db:reset`
  end

  def bring_window_to_front
    window = page.current_window
    page.switch_to_window(window)
  end

  def clear_local_storage
    Capybara.execute_script 'localStorage.clear()' rescue nil
  end

  # Thanks to https://stackoverflow.com/a/38085926/5874744
  def scroll_to(element)
    script = <<-JS
      arguments[0].scrollIntoView(true);
    JS

    page.execute_script(script, element.native)
  end

  # thanks to https://coderwall.com/p/bkrg8a/ruby-wait_while
  def wait_for_this(opts={}, &block)
    defaults = {
      timeout: 5
    }
    options = defaults.merge(opts)

    start = Time.now
    while (result = !block.call)
      break if (Time.now - start).to_i >= options[:timeout]
      sleep(0.3)
    end

    if(options[:tag])
      puts "wait_for_this [#{options[:tag]}] waited #{(Time.now - start).to_i} seconds."
    end

    !result
  end
  
  def reload_page
    evaluate_script("window.location.reload()")
  end
end

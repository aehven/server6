class ApplicationLog
  def initialize
    @log_path = "#{Rails.root.to_path}/log/#{Rails.env}.log"
  end

  def clear
    File.open(@log_path, "w") do |file|
      file.truncate(0)
    end
  end

  def open
    @log_file = File.open(@log_path, "r")
  end

  def flush
    @log_file.flush
  end

  def grep(pattern)
    open
    flush
    # https://stackoverflow.com/a/637391/5874744
    @log_file.grep(pattern)
  end
end

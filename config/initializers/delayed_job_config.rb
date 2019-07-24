require 'fileutils'

FileUtils.mkdir_p("#{Rails.root}/log")
Delayed::Worker.logger = Rails.logger
# Delayed::Worker.logger = Logger.new(Rails.root.join('log', 'delayed_job.log'))

Delayed::Worker.max_attempts = 3
Delayed::Worker.max_run_time = ENV.fetch('DJ_MAX_RUN_TIME_SECONDS') { Rails.env == "production" ? 180 : 99999999}
Delayed::Worker.read_ahead = 1
Delayed::Worker.destroy_failed_jobs = true

Delayed::Worker.sleep_delay = Integer(ENV['DELAYED_JOB_PERIOD'] || 5)

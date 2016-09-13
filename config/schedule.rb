# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
ENV['RAILS_ENV'] = "development"
# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
every :day, at: '3:14pm' do
  rake "monitor:jx3"
end

# Learn more: http://github.com/javan/whenever

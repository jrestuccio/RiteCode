# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

job_type :rake_test,    "cd :path && :environment_variable='development' bundle exec rake :task --silent :output"

every 2.days, :at => '4:30 am' do
  rake "user_delete:cleanup"
end

every 1.minute do
  rake_test "user_delete:cleanup"
end
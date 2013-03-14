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

every 1.month, :at => '15th 7:13am' do
	runner "Application.send_mail_licence"
end

every 60.minutes do
	runner "Statistic.viewstattable_to_tablestat"
end

every 7.days do 
	runner "User.delete_file_ftp"
end

# Learn more: http://github.com/javan/whenever

#every 5.minutes do
#	runner "Application.new.crontabapplications"
#end

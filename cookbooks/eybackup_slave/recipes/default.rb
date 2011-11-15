# set backup interval
# cron_hour = if node[:backup_interval].to_s == '24'
#               "19"    # 0100 Pacific, per support's request -> 19 -> 4am en Madrid
#               # NB: Instances run in the Pacific (Los Angeles) timezone
#             elsif node[:backup_interval]
#               "*/#{node[:backup_interval]}"
#             else
#               "1"
#             end

# if ['db_master'].include?(node[:instance_role])
  cron "mysql" do
    minute   '10'
    hour     '4'
    day      '*'
    month    '*'
    weekday  '*'
    command  "/usr/local/ey_resin/bin/eybackup"
    not_if { node[:backup_window].to_s == '0' }
  end
# end
#
# if ['db_slave'].include?(node[:instance_role])
#   cron "mysql" do
#     action :delete
#   end
# end
#

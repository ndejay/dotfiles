#!/opt/local/bin/ruby

# Expects the file ~/.serve_sshfs.local to resemble the following:
# 
# $MOUNTS = [
#   {
#     source:      'user@remote:/path/to/source',
#     destination: '/path/to/destination',
#     port:        '22', # Optional
#     ssid:        'My Home Network', # Optional -- restricts sshfs
#                                     # mounting to network SSID
#   },
#   {
#     source:      'user@serve:/path/to/source',
#     destination: '/path/to/destination',
#   }
# ]
#
# $OPTIONS = ['auto_cache', 'defer_permissions', 'follow_symlinks',
#             'noappledouble', 'reconnect'] # Any sshfs or fuse option

load '~/.serve_sshfs.local'

##########
# Script #
##########

AIRPORT        = '/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
SSID           = `#{AIRPORT} -I | grep '.* SSID:' | sed 's/^.* SSID: //'`.chomp
ACTIVE_MOUNTS  = `mount`

$MOUNTS.each do |mount|
  # hostname     = mount[:source].split(':')[0]
  destination  = File.expand_path(mount[:destination])
  volname      = mount[:volname] || File.basename(destination)
  options      = ($OPTIONS + ["volname='#{volname}'"]).join(',')
  port         = mount[:port] ? "-p #{mount[:port]}" : ''
  is_reachable = true # system("ping -c 1 #{hostname}")
  is_safe      = mount[:ssid] ? mount[:ssid] == SSID : true
  is_mounted   = ACTIVE_MOUNTS.include? destination

  if is_safe && is_reachable && !is_mounted
    `. ~/.profile && sshfs #{port} -o #{options} '#{mount[:source]}' '#{destination}'`
  elsif !(is_safe && is_reachable) && is_mounted
    `umount '#{destination}'`
  end
end

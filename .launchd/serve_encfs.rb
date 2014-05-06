#!/opt/local/bin/ruby

#################
# Configuration #
#################

MOUNTS = [
  {
    source:      '~/Dropbox/Private',
    destination: '~/Private',
    password:    `security find-generic-password -l 'EncFS' -w`.chomp,
  },
]

##########
# Script #
##########

ACTIVE_MOUNTS = `mount`

MOUNTS.each do |mount|
  source      = File.expand_path(mount[:source])
  destination = File.expand_path(mount[:destination])
  volname     = mount[:volname] || File.basename(destination)
  is_mounted  = ACTIVE_MOUNTS.include? destination

  if !is_mounted
    `. ~/.profile && echo '#{mount[:password]}' | \
       encfs -o noappledouble,volname='#{volname}' -S '#{source}' '#{destination}'`
  end
end

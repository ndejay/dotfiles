#!/usr/bin/ruby

require 'yaml'

path           = File.dirname(__FILE__)
config         = YAML.load_file("#{path}/encfs.yml")
active_mounts  = `mount`

config['mounts'].each do |mount|
  source      = File.expand_path(mount['source'])
  destination = File.expand_path(mount['destination'])
  volname     = mount['volname'] || File.basename(destination)
  options     = (config['options'] + ["volname='#{volname}'"]).join(',')
  is_mounted  = active_mounts.include? destination

  if !is_mounted
    `echo '#{mount['password']}' | #{config['encfs_path']} \
      -o #{options} -S '#{source}' '#{destination}'`
  end
end

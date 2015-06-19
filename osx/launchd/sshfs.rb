#!/usr/bin/ruby

require 'yaml'

path           = File.dirname(__FILE__)
config         = YAML.load_file("#{path}/sshfs.yml")
active_mounts  = `mount`

config['mounts'].each do |mount|
  destination  = File.expand_path(mount['destination'])
  volname      = mount['volname'] || File.basename(destination)
  options      = (config['options'] + ["volname='#{volname}'"]).join(',')
  port         = mount['port'] ? "-p #{mount['port']}" : ''
  is_mounted   = active_mounts.include? destination

  if !is_mounted 
    system 'mkdir', '-p', destination
    `#{config['sshfs_path']} #{port} -o #{options} \
      '#{mount['source']}' '#{destination}'`
  end
end

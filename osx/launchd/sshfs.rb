#!/usr/bin/ruby

require 'yaml'

path           = File.dirname(__FILE__)
config         = YAML.load_file("#{path}/sshfs.yml")
active_mounts  = `mount`.split("\n").map do |line|
  l = line.split(" on ")
  [l[1].split(" (")[0], l[0]]
end
active_mounts  = Hash[active_mounts]

config['mounts'].each do |mount|
  destination  = File.expand_path(mount['destination'])
  volname      = mount['volname'] || File.basename(destination)
  options      = (config['options'] + ["volname='#{volname}'"]).join(',')
  port         = mount['port'] ? "-p #{mount['port']}" : ''
  is_mounted   = active_mounts.keys.include? destination

  if !is_mounted
    system 'mkdir', '-p', destination
    puts "#{config['sshfs_path']} #{port} -o #{options} \ '#{mount['source']}' '#{destination}'"
    `#{config['sshfs_path']} #{port} -o #{options} \ '#{mount['source']}' '#{destination}'`
  end
end

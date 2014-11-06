#!/usr/bin/ruby

require_relative 'sshfs.local'

active_mounts  = `mount`

$mounts.each do |mount|
  destination  = File.expand_path(mount[:destination])
  volname      = mount[:volname] || File.basename(destination)
  options      = ($options + ["volname='#{volname}'"]).join(',')
  port         = mount[:port] ? "-p #{mount[:port]}" : ''
  is_mounted   = active_mounts.include? destination

  if !is_mounted 
    system 'mkdir', '-p', destination
    `#{$sshfs_path} #{port} -o #{options} \
      '#{mount[:source]}' '#{destination}'`
  end
end

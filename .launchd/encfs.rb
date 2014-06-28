#!/usr/bin/ruby

require_relative 'encfs.local'

active_mounts  = `mount`

$mounts.each do |mount|
  source      = File.expand_path(mount[:source])
  destination = File.expand_path(mount[:destination])
  volname     = mount[:volname] || File.basename(destination)
  options     = ($options + ["volname='#{volname}'"]).join(',')
  is_mounted  = active_mounts.include? destination

  if !is_mounted
    `echo '#{mount[:password]}' | #{$encfs_path} \
      -o #{options} -S '#{source}' '#{destination}'`
  end
end

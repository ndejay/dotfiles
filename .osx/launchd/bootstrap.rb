#!/usr/bin/env ruby

require 'erb'

path_to_launchd = File.expand_path('~/.dotfiles/.osx/launchd')
Dir.chdir(path_to_launchd)

# If more than one argument is specified, arguments 2..n are interpreted as
# agents and must exist on disk. If no agents are specified, all agents are
# considered.

agents = Dir['*.plist.erb'].map { |d| d.sub(/\.erb$/, '') }

if ARGV.length > 1
  agents = *ARGV.map { |prefix| prefix + '.plist' } & agents
  if agents.empty?
    $stderr.puts "bootstrap.rb: unknown agent #{ARGV[0]}"
    $stderr.puts "usage: ./bootstrap.rb [on|reset|off]"
    exit 1
  end
end

# If the required first argument, which specifies the action to be taken on
# agents, is unrecognized, abort the script.

if !['on', 'reset', 'off'].include? ARGV[0]
  $stderr.puts "bootstrap.rb: illegal mode #{ARGV[0]}"
  $stderr.puts "usage: ./bootstrap.rb [on|reset|off]"
  exit 1
end

# Perform specified action on all considered agents.

agents.each do |agent|
  template = ERB.new(File.open("#{path_to_launchd}/#{agent}.erb").read)
  source = "#{path_to_launchd}/#{agent}"

  # Create plist from ERB template
  File.open(source, 'w') { |f| f.write(template.result(binding)) }

  target = File.expand_path("~/Library/LaunchAgents/#{agent}")

  if ARGV[0] != 'on' # If action is: reset, off
    if File.exists? target
      `launchctl unload -w #{target}` && File.unlink(target)
      puts "#{target} removed"
    else
      puts "#{target} does not exist: skipping"
    end
  end

  if ARGV[0] != 'off' # If action is: on, reset
    if File.exists? target
      puts "#{target} exists: skipping"
    else
      File.link(agent, target) && `launchctl load -w #{target}`
      puts "#{target} linked"
    end
  end
end

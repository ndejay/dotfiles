#!/usr/bin/env ruby

#################
# Configuration #
#################

USER_AGENTS = [
  'serve_encfs',
  'serve_sshfs',
]

##########
# Script #
##########

if ARGV.length < 2
  AGENTS = USER_AGENTS
else
  AGENTS = *ARGV & USER_AGENTS
  if AGENTS.empty?
    $stderr.puts "setup.rb: unknown agent #{ARGV[0]}"
    exit 1
  end
end

def traverse(yes, no)
  AGENTS.each do |agent|
    agent = "#{agent}.plist"
    target = File.expand_path("~/Library/LaunchAgents/#{agent}")
    puts ((File.exists? target) ? yes : no).call(agent, target)
  end
end

def link(agent, target)
  File.link(agent, target) && `launchctl load -w #{target}`
end

def unlink(target)
  `launchctl unload -w #{target}` && File.unlink(target)
end

def add
  yes = lambda { |_, target| "#{target} exists: skipping" }
  no = lambda { |agent, target| link(agent, target); "#{target} linked" }
  traverse(yes, no)
end

def rm
  yes = lambda { |_, target| unlink(target); "#{target} removed" }
  no = lambda { |_, target| "#{target} does not exist: skipping" }
  traverse(yes, no)
end

case ARGV[0]
when 'add'
  add
when 'reset'
  rm
  add
when 'rm'
  rm
else
  $stderr.puts "setup.rb: illegal mode #{ARGV[0]}"
  $stderr.puts "usage: ./setup.rb [add|reset|rm]"
  exit 1
end

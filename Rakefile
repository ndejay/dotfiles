require 'fileutils'
require 'yaml'

###############################################################################
#
# Load other Rakefiles
#
###############################################################################

['osx', 'ssh'].each do |m|
  import "#{m}/Rakefile"
end

###############################################################################
#
# Config
#
###############################################################################

manifest = YAML.load_file('manifest.yml')['dotfiles']
home = File.realpath(ENV['HOME'])

###############################################################################
#
# Helpers
#
###############################################################################

class String
  def remove_substring(substring)
    sub(/#{substring}/, '')
  end
end

###############################################################################
#
# Rake tasks
#
###############################################################################

desc "Install dotfiles to the user's home directory"
task :install do
  sh 'git submodule update --init'

  manifest.each do |rc|
    target = "#{home}/#{rc}"

    if !File.exists?(target)
      source = "#{Dir.pwd}/#{rc}".remove_substring("#{home}/")

      slashes = "#{target}".remove_substring("#{home}/").count('/')
      slashes.times do
        source = "../#{source}"
      end

      FileUtils.ln_s(source, target)
      puts "#{target} linked"
    else
      puts "#{target} already exists: skipping"
    end
  end
end

desc "Uninstall dotfiles from the user's home directory"
task :uninstall do
  manifest.each do |rc|
    target = "#{home}/#{rc}"

    if File.exists?(target) || File.symlink?(target)
      FileUtils.rm_rf(target)
      puts "#{target} removed"
    else
      puts "#{target} does not exist: skipping"
    end
  end
end

desc "Reinstall dotfiles in the user's home directory"
task :reinstall do
  Rake::Task['uninstall'].execute
  Rake::Task['install'].execute
end

task :default do
  puts "Please select one of the following options:"
  puts `rake -T`
end

# vim: syntax=ruby

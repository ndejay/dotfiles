###############################################################################
#
# Load other Rakefiles
#
###############################################################################

['link', 'osx', 'git', 'ssh'].each do |m|
  import "#{m}/Rakefile"
end

###############################################################################
#
# Rake tasks
#
###############################################################################

desc "Update submodules."
task :update do
  sh 'git submodule update --init'
  sh 'git submodule foreach git pull origin master'
end

# vim: syntax=ruby

desc "Install hg config"
task :hg do
  puts "** Installing hg config..."
  symlink('hgrc', __FILE__, '~/.hgrc')
end

task :install => :hg

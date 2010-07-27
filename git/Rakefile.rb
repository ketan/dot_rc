desc "Install git config"
task :git do
  puts "** Installing git config..."
  symlink('gitconfig', __FILE__, '~/.gitconfig')
end

task :install => :git

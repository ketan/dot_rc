desc "Install git config"
task :git do
  puts "** Installing git config..."
  symlink('gitconfig', __FILE__, '~/.gitconfig')
  symlink('gitignore', __FILE__, '~/.gitignore')
end

task :install => :git

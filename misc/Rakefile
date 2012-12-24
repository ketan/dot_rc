desc "Install misc config"
task :misc do
  puts "** Installing misc config..."
  [:ackrc, :ctags, :gemrc, :gitconfig, :gitignore, :hgrc, :irbrc, :rvmrc].each do |rc|
    symlink(rc, __FILE__, "~/.#{rc}")
  end
end

task :install => :misc

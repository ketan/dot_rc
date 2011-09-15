desc "Install misc config"
task :misc do
  puts "** Installing misc config..."
  [:ackrc, :rvmrc, :gemrc, :ctags].each do |rc|
    symlink(rc, __FILE__, "~/.#{rc}")
  end
end

task :install => :misc

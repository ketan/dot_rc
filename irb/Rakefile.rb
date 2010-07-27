desc "Install irb config"
task :irb do
  puts "** Installing irb config..."
  rm File.expand_path("~/.irbrc")
  ln_s File.expand_path(File.join(File.dirname(__FILE__), 'irbrc')), File.expand_path("~/.irbrc"), :verbose => true
end

task :install => :irb

desc "Install zsh config"
task :zsh do
  puts "** Installing zsh config..."
  symlink('zshrc', __FILE__, '~/.zshrc')
  symlink('zshenv', __FILE__, '~/.zshenv')
  
  FileList["#{File.dirname(__FILE__)}/zsh.d/lib/*.zsh"].each do |f|
    f.gsub!(/^\.\//, '')
    symlink("../#{f}", __FILE__ , "~/.#{f}")
  end
end

task :install => :zsh

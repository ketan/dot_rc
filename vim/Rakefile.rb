desc "Install vim config"
task :vim do
  puts "** Installing vim config..."
  symlink('vimrc', __FILE__, '~/.vimrc')
  symlink('gvimrc', __FILE__, '~/.gvimrc')
  mkdir_p File.expand_path('~/.vim/swp')

  FileList["#{File.dirname(__FILE__)}/.vim/**/*.*"].reject{|f| f =~ /(.(git|hg)ignore)|README|Rake/}.each do |f|
    f.gsub!(/^\.\//, '')
    symlink(f.gsub(/^vim\//, ''), __FILE__ , "~/.#{f.gsub('.vim/', '')}")
  end
  
  Dir["#{File.dirname(__FILE__)}/externals/*"].each do |plugin|
    FileList["#{plugin}/**/*.*"].reject{|f| f =~ /(.(git|hg)ignore)|README|Rake/}.each do |f|
      symlink("../#{f}", __FILE__ , "~/.vim/" + f.gsub!("#{plugin}/", ''))
    end
  end
  
  # Dir["#{VIM_DIR}/snippets/*.snippets"].each {|f| rm f}
end

task :install => :vim

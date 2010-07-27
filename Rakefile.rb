def symlink(src, context, dest)
  dest = File.expand_path(dest)
  src = File.expand_path(File.join(File.dirname(context), src))
  rm_f dest
  mkdir_p File.dirname(dest), :verbose => false
  link src, dest, :verbose => true
end

task :install => []

Dir["*/Rakefile.rb"].each {|file| require file}

desc 'the default task'
task :default => [:install]

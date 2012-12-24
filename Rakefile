def symlink(src, context, dest)
  dest = File.expand_path(dest)
  src = File.expand_path(File.join(File.dirname(context), src.to_s))
  rm_f dest
  mkdir_p File.dirname(dest), :verbose => false
  ln_s src, dest, :verbose => true
end

task :install => []

Dir["*/Rakefile"].each {|file| load file}

desc 'the default task'
task :default => [:install]

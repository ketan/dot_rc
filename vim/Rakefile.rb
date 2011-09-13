require 'rake'
require 'yaml'

task :vim => 'vim:install'
task :install => 'vim'

namespace :vim do
  HERE=File.expand_path(File.dirname(__FILE__))
  PLUGINS_DIR=File.join(HERE, 'plugins')
  PLUGINS_WITH_RAKE = {'Command-T' => 'make', 'nerdtree' => 'install'}
  FOLDERS = %w(colors ftdetect ftplugin indent syntax doc plugin autoload snippets macros after ruby)
  PLUGIN_URLS = YAML.load_file(File.expand_path( '../plugins.yml', __FILE__))['plugins']
  PLUGINS = PLUGIN_URLS.keys + %w(personal cscope matchit vim-spec) + PLUGINS_WITH_RAKE.keys
  DOTVIM = "#{ENV['HOME']}/.vim"
  desc "Get latest on all plugins"
  task :preinstall do
    mkdir_p(PLUGINS_DIR)
    cd PLUGINS_DIR do
      if ENV['PLUGIN'].nil?
        PLUGINS.each do |plugin|
          get_latest(plugin)
        end
      else
        get_latest(ENV['PLUGIN'])
      end
    end
  end

  def get_latest(plugin)
    puts "getting latest: #{plugin}"
    if File.directory?(plugin)
      cd(plugin) { update_current_dir }
    elsif PLUGIN_URLS[plugin]
      clone_project(plugin, PLUGIN_URLS[plugin])
    end
  end

  def clone_project(name, script_url_yaml)
    sh("git clone #{PLUGIN_URLS[name]['git']} #{name}") if script_url_yaml['git']
    sh("hg clone #{PLUGIN_URLS[name]['hg']} #{name}") if script_url_yaml['hg']
    sh("svn checkout #{PLUGIN_URLS[name]['svn']} #{name}") if script_url_yaml['svn']
  end

  def update_current_dir
    sh('git pull origin master') if File.directory?('.git')
    sh('hg pull && hg update') if File.directory?('.hg')
    sh('svn up') if File.directory?('.svn')
  end

  desc "Install the files into ~/.vim"
  task :install => :preinstall do
    FileUtils.mkdir_p FOLDERS.map{|f| "#{DOTVIM}/#{f}" }
    FileUtils.mkdir_p "#{DOTVIM}/tmp"
    FileUtils.mkdir_p "#{DOTVIM}/swp"

    cd PLUGINS_DIR do
      PLUGINS_WITH_RAKE.each do |plugin, command|
        if !File.directory?(plugin)
          puts "#{plugin} doesn't exist. Please run 'rake preinstall'"
        else
          puts "making #{plugin}"
          cd(plugin) { sh "rake #{command}" }
        end
      end
    end
    copy_dot_files
    cd PLUGINS_DIR do
      PLUGINS.each do |plugin|
        if !File.directory?(plugin)
          puts "#{plugin} doesn't exist. Please run 'rake preinstall'"
        else
          if File.directory?("#{plugin}/.svn")
            cd(plugin) { sh("svn export . --force #{DOTVIM}") }
          else
            puts "installing #{plugin}"
            FOLDERS.each do |f|
              cd(plugin) { FileUtils.cp_r Dir["#{f}/*"], "#{DOTVIM}/#{f}" }
            end
          end
        end
        sh(PLUGIN_URLS[plugin]['post_install']) if PLUGIN_URLS[plugin] && PLUGIN_URLS[plugin]['post_install']
      end
    end
  end

  def copy_dot_files
    symlink('vimrc', __FILE__, '~/.vimrc')
    symlink('gvimrc', __FILE__, '~/.gvimrc')
  end

  def link_if_it_doesnt_exist(file, condition = 'f')
    sh(<<-EOSCRIPT
      if [ ! -#{condition} $HOME/.#{file} ]; then
        ln -s $PWD/#{file} $HOME/.#{file}
        echo "Linking .#{file}"
      else
        echo "Skipping .#{file}, it already exists"
      fi
    EOSCRIPT
          )
  end

end

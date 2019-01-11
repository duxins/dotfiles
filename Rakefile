require 'fileutils'

def command_exists?(command)
  system("which #{command} &> /dev/null")
end

def create_symlink(target, link)
  unless File.exists?(link)
    FileUtils.ln_s(target, link, verbose: true)
  else 
    puts "[SKIPPING] #{link} exists"
  end
end

# Homebrew
def install_homebrew
  return if command_exists?('brew')
  puts 'Installing brew ...'
  system('/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"')  or raise 'Failed to install brew'
end 

def brew_install(package, options = nil)
  return if system("brew ls --version #{package} &> /dev/null")
  puts "Installing #{package} ..." 
  system("brew install #{package} #{options}") or raise "Failed to install #{package}"
end

# rbenv
def install_rbenv
  return if command_exists?('rbenv')
  puts 'Installing rbenv ...'
  system('brew install rbenv') or raise "Failed to install rbenv"
end

# ruby
def install_ruby
  ver = "2.6.0"
  puts "Installing ruby #{ver} ..."
  system("rbenv install #{ver} -s")
end

# ZSH
def install_oh_my_zsh
  return if File.exist?(File.expand_path("~/.oh-my-zsh"))
  puts 'Installing oh-my-zsh ...' 
  system('sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"') or raise 'Failed to install oh-my-zsh'
end

def configure_oh_my_zsh
  puts "Linking zsh config files ..."
  ['alias.zsh', 'path.zsh'].each do |file|
    target = __dir__ + '/zsh/' + file
    link = File.join(File.expand_path("~/.oh-my-zsh/custom"), file)
    create_symlink(target, link)
  end
end

def configure_git
  puts "Linking git config files ..."
  ['.gitconfig', '.gitignore_global'].each do |file|
    target = File.join(__dir__, file)
    link = File.join(File.expand_path("~"), file)
    create_symlink(target, link)
  end
end

task :setup do
  install_homebrew
  install_rbenv
  install_oh_my_zsh
  configure_oh_my_zsh
  configure_git

  brew_install('icu4c')
  brew_install('telnet')
  brew_install('screen')

  brew_install('python@2')
  brew_install('tmux')
  brew_install('the_silver_searcher')

  install_ruby

end


desc "Link config files to oh-my-zsh's custom directory"
task :configure_zsh do
  configure_oh_my_zsh
end

desc "Link git config files (gitconfig, gitignore_global)"
task :configure_git do
  configure_git
end

task default: [:setup]

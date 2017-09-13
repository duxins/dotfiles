def command_exists?(command)
  system("which #{command} &> /dev/null")
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

# ZSH
def install_oh_my_zsh
  return if File.exist?(File.expand_path("~/.oh-my-zsh"))
  puts 'Installing oh-my-zsh ...' 
  system('sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"') or raise 'Failed to install oh-my-zsh'
end

def configure_oh_my_zsh
  ['alias.zsh'].each do |file|
    path = __dir__ + '/zsh/' + file
    system("ln -snf #{path}  ~/.oh-my-zsh/custom/")
  end
end

task :setup do
  install_homebrew
  install_rbenv
  install_oh_my_zsh
  configure_oh_my_zsh

  brew_install('macvim', '--with-override-system-vim')
  brew_install('tmux')

end


desc "Link config files to oh-my-zsh's custom directory"
task :configure_zsh do
  configure_oh_my_zsh
end

task default: [:setup]

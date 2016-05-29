def command_exists(command)
  system("which #{command} &> /dev/null")
end

# Homebrew
def install_homebrew
  return if command_exists('brew')
  puts 'Installing brew ...'
  system('/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"')
end 

# RVM
def install_rvm
  return if command_exists('rvm')
  puts 'Installing RVM ...'
  system('\curl -sSL https://get.rvm.io | bash -s stable')
end

# ZSH
def install_oh_my_zsh
  return if File.exist?(File.expand_path("~/.oh-my-zsh"))
  puts 'Installing oh-my-zsh ...' 
  system('sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"')
end

task :setup do
  install_homebrew
  install_rvm
  install_oh_my_zsh
end

task default: [:setup]
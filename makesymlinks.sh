#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bash_prompt tmux.conf vimrc"      # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    if [ -f ~/.$file ]; then
        echo "Moving any existing dotfiles from ~ to $olddir"
        mv ~/.$file ~/dotfiles_old/
    fi
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# some bashrc customizations
cat >> ~/.bashrc << 'EOF'

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export COLORTERM=truecolor
export LS_COLORS="rs=0:di=01;38;2;122;162;247:ln=01;38;2;125;207;255:mh=00:pi=40;38;2;224;175;104:so=01;38;2;187;154;247:do=01;38;2;187;154;247:bd=01;38;2;224;175;104;40:cd=01;38;2;224;175;104;40:or=01;38;2;247;118;142;40:mi=00:su=38;2;26;27;38;41:sg=38;2;26;27;38;43:ca=38;2;26;27;38;41:tw=38;2;26;27;38;42:ow=38;2;122;162;247;42:st=38;2;192;202;245;44:ex=01;38;2;158;206;106:*.tar=01;38;2;247;118;142:*.tgz=01;38;2;247;118;142:*.arc=01;38;2;247;118;142:*.arj=01;38;2;247;118;142:*.taz=01;38;2;247;118;142:*.lha=01;38;2;247;118;142:*.lz4=01;38;2;247;118;142:*.lzh=01;38;2;247;118;142:*.lzma=01;38;2;247;118;142:*.tlz=01;38;2;247;118;142:*.txz=01;38;2;247;118;142:*.tzo=01;38;2;247;118;142:*.t7z=01;38;2;247;118;142:*.zip=01;38;2;247;118;142:*.z=01;38;2;247;118;142:*.dz=01;38;2;247;118;142:*.gz=01;38;2;247;118;142:*.lrz=01;38;2;247;118;142:*.lz=01;38;2;247;118;142:*.lzo=01;38;2;247;118;142:*.xz=01;38;2;247;118;142:*.zst=01;38;2;247;118;142:*.tzst=01;38;2;247;118;142:*.bz2=01;38;2;247;118;142:*.bz=01;38;2;247;118;142:*.tbz=01;38;2;247;118;142:*.tbz2=01;38;2;247;118;142:*.tz=01;38;2;247;118;142:*.deb=01;38;2;247;118;142:*.rpm=01;38;2;247;118;142:*.jar=01;38;2;247;118;142:*.war=01;38;2;247;118;142:*.ear=01;38;2;247;118;142:*.sar=01;38;2;247;118;142:*.rar=01;38;2;247;118;142:*.alz=01;38;2;247;118;142:*.ace=01;38;2;247;118;142:*.zoo=01;38;2;247;118;142:*.cpio=01;38;2;247;118;142:*.7z=01;38;2;247;118;142:*.rz=01;38;2;247;118;142:*.cab=01;38;2;247;118;142:*.wim=01;38;2;247;118;142:*.swm=01;38;2;247;118;142:*.dwm=01;38;2;247;118;142:*.esd=01;38;2;247;118;142:*.jpg=01;38;2;187;154;247:*.jpeg=01;38;2;187;154;247:*.mjpg=01;38;2;187;154;247:*.mjpeg=01;38;2;187;154;247:*.gif=01;38;2;187;154;247:*.bmp=01;38;2;187;154;247:*.pbm=01;38;2;187;154;247:*.pgm=01;38;2;187;154;247:*.ppm=01;38;2;187;154;247:*.tga=01;38;2;187;154;247:*.xbm=01;38;2;187;154;247:*.xpm=01;38;2;187;154;247:*.tif=01;38;2;187;154;247:*.tiff=01;38;2;187;154;247:*.png=01;38;2;187;154;247:*.svg=01;38;2;187;154;247:*.svgz=01;38;2;187;154;247:*.mng=01;38;2;187;154;247:*.pcx=01;38;2;187;154;247:*.mov=01;38;2;187;154;247:*.mpg=01;38;2;187;154;247:*.mpeg=01;38;2;187;154;247:*.m2v=01;38;2;187;154;247:*.mkv=01;38;2;187;154;247:*.webm=01;38;2;187;154;247:*.ogm=01;38;2;187;154;247:*.mp4=01;38;2;187;154;247:*.m4v=01;38;2;187;154;247:*.mp4v=01;38;2;187;154;247:*.vob=01;38;2;187;154;247:*.qt=01;38;2;187;154;247:*.nuv=01;38;2;187;154;247:*.wmv=01;38;2;187;154;247:*.asf=01;38;2;187;154;247:*.rm=01;38;2;187;154;247:*.rmvb=01;38;2;187;154;247:*.flc=01;38;2;187;154;247:*.avi=01;38;2;187;154;247:*.fli=01;38;2;187;154;247:*.flv=01;38;2;187;154;247:*.gl=01;38;2;187;154;247:*.dl=01;38;2;187;154;247:*.xcf=01;38;2;187;154;247:*.xwd=01;38;2;187;154;247:*.yuv=01;38;2;187;154;247:*.cgm=01;38;2;187;154;247:*.emf=01;38;2;187;154;247:*.ogv=01;38;2;187;154;247:*.ogx=01;38;2;187;154;247:*.aac=00;38;2;125;207;255:*.au=00;38;2;125;207;255:*.flac=00;38;2;125;207;255:*.m4a=00;38;2;125;207;255:*.mid=00;38;2;125;207;255:*.midi=00;38;2;125;207;255:*.mka=00;38;2;125;207;255:*.mp3=00;38;2;125;207;255:*.mpc=00;38;2;125;207;255:*.ogg=00;38;2;125;207;255:*.ra=00;38;2;125;207;255:*.wav=00;38;2;125;207;255:*.oga=00;38;2;125;207;255:*.opus=00;38;2;125;207;255:*.spx=00;38;2;125;207;255:*.xspf=00;38;2;125;207;255:"
source ~/.bash_prompt
EOF

source ~/.bashrc

# vim configuration 
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -n -es --cmd 'set nomore' -u ~/.vimrc +PluginInstall +qall < /dev/null 2>/dev/null

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d $dir/oh-my-zsh/ ]]; then
        git clone http://github.com/robbyrussell/oh-my-zsh.git
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        if [[ -f /etc/redhat-release ]]; then
            sudo yum install zsh
            install_zsh
        fi
        if [[ -f /etc/debian_version ]]; then
            sudo apt-get install zsh
            install_zsh
        fi
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
fi
}

#install_zsh

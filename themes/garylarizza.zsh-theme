# I should probably restructure this as a plugin of some kind.
#
alias vmrun='/Applications/VMware\ Fusion.app/Contents/Library/vmrun'

function vmfusionlist() {
  vmrun list | awk 'BEGIN { ORS=" " ; FS="/" }  { if (NR>1) {print $NF} }'
}

# this is insane. Must get the load time of puppet --version faster.
function puppetversion() {
  awk 'BEGIN { ORS=" " } /PUPPETVERSION =/ { gsub("\047", "") ; printf $3 }' ~/src/puppet/lib/puppet/version.rb
}

PROMPT=$'%{$fg[red]%}┌(%!) [%{$fg_bold[white]%}%n@%m%{$reset_color%}%{$fg[red]%}] [%{$fg_bold[white]%}puppet: $(puppetversion)%{$reset_color%}%{$fg[red]%}] [%{$fg_bold[white]%} $(vmfusionlist)%{$reset_color%}%{$fg[red]%}] %{$(git_prompt_info)%}%(?,,%{$fg[red]%}[%{$fg_bold[white]%}%?%{$reset_color%}%{$fg[red]%}])
%{$fg[red]%}└(%{$fg_bold[white]%}%~%{$reset_color%}%{$fg[red]%})▷%{$reset_color%} '
PS2=$' %{$fg[red]%}|>%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}[%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[red]%}] "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}⚡%{$reset_color%}"



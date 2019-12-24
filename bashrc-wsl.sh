#!/bin/bash
# 环境变量
export user=sidian #用户名
export Win_Home=/mnt/c # windows家目录

export home=$Win_Home/Users/$user #设置Windows家目录的环境变量
export HOME=$home # 当cd时,可直接跳转到Windows家目录
export hosts_home=/mnt/c/Windows/System32/drivers/etc # 配置hosts环境变量
export notes=$home/Documents/blogs/sidian123/notes # 笔记路径
export PATH=/home/$USER/bin:$PATH # 将wsl家目录中的bin/目录加入到环境变量中
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64 # Java
export typora_home="$Win_Home/Program Files/Typora" # typora

# 当打开终端并且位于Linux家目录时,则切换到Windows的家目录中.
# 这里考虑到了作为VSCode默认终端的情况.
[[ $PWD == "$HOME" ]] && cd "$home"

# 取消ls高亮,改用后缀方式
alias ls="ls --file-type"
# 配置ll
alias ll="ls -al --file-type"
# 打开当前目录
alias open='explorer.exe .'
# 方便连接服务器
alias remote-sh='ssh root@sh.sidian.live'
alias remote-hk='ssh root@hk.sidian.live'
alias proxy-sh='ssh -D 1024 root@sh.sidian.live'
alias proxy-hk='ssh -D 1025 root@hk.sidian.live'
alias lf-sh='ssh -L 1025:localhost:1024 root@sh.sidian.live' # local forward to sh
# 方便使用typora
function typora () {
  "$typora_home/bin/typora.exe" "$*" >/dev/null 2>&1 &
}
# 方便push
function push () {
  # 获取注释
  comment='add some' # 默认注释
  if [[ -n $1 ]] ; then # 若注释存在
    # 使用该注释
    comment=$*
  fi
  # 提交并推送
  git add . && git commit -m "$comment"
  git push
}
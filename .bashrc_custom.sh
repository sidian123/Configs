#!/usr/bin/env bash
# 环境变量
export USER=$(whoami) #用户名
export Win_Home=/c # windows家目录

export notes=$HOME/Documents/blogs/sidian123/notes # 笔记路径
export typora_home="$Win_Home/Program Files/Typora" # typora

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
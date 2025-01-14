# 设置终端标题为当前目录名
set_title() {
    echo -ne "\033]0;${PWD##*/}\007"
}
PROMPT_COMMAND="set_title"


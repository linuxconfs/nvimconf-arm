# 痛点

## 已解决

### nvim

| 痛点                                                                   | 解决                                                                                                                                                                                                                                             |
|------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `vawp` 进行单词替换后剪切板里的内容被取缔了，想重复替换时需要再次 yank | 用寄存器 `vaw"0p` 可以粘贴上次拷贝内容<br>因此可以绑定 `keymap("v", "p", '"0p')`                                                                                                                                                                 |
| `arm` 环境有些插件不能用 go install 或 mason 方式安装                  | 1. 可以通过手动安装 arm 架构的 release 包，再配置进 nvim<br>2. 将gcc换成支持的[cross-compiler](https://www.acmesystems.it/arm9_toolchain)比如`arm-linux-gnueabi-gcc`<br>3. 通过`CC=arm-linux-gnueabihf-gcc go run/build/install`可以成功解决问题 |
| 想快速打开文件树中某个文件                                             | 可以用 telescope 查找一个文件而不是在文件树中找。                                                                                                                                                                                                |
| 在文件树中按前缀寻找目标文件                                           | 通过`/`可以按照输入的字符匹配符合条件的文件                                                                                                                                                                                                      |
| nvim 关闭后再重新打开时上一次的 workspace 就没了                       | `folk/persistence.nvim` 插件可以恢复上次退出时的 session                                                                                                                                                                                         |
| 文件树中打开一个文件会覆盖掉当前 buffer                                | 1. `<S-s> or <s>`开启一个新的分屏<br>2. 光标进入某个期望被替换/分屏的 buffer -> `:Neotree or :Nerdtree` -> 打开/分屏打开某文件                                                                                                                   |
| git conflict 出现时不知如何解决, 如何分屏查看 git diff                 | 1. `rhysd/conflict-marker.vim`可以高亮出冲突的部分<br>2. `sindrets/diffview.nvim`可以分屏查看 git diff，提供 merge tool 方便冲突处理                                                                                                            |
| 使用时有一些报错提示来不及看就消失了                                   | `:messages` 可以查看历史报错消息                                                                                                                                                                                                                 |
| 有时候保存文件会出来很多报错弹窗导致卡顿                               | 禁用掉插件`nvim-notify`就可以                                                                                                                                                                                                                    |
| lsp diagnostic 显示得太靠右，总需要 scroll right 才能看全              | 1. `{ "glepnir/lspsaga.nvim", commit = "b7b4777", event = "VeryLazy" }` <br>2. `buf_set_keymap("n", "<space>ge", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)`                                                                                 |
| 光标如何在驼峰之间跳转                                                 | 1. `bkad/CamelCaseMotion`<br>2. `vim.cmd([[set rnu=true]])`                                                                                                                                                                                      |
| Telescope 想分屏打开一个文件                                           | `<C-v>`                                                                                                                                                                                                                                          |
| 左上，左下，右 三个分屏，关掉了右边分屏，如何恢复布局                  | 此时分为上下分屏，在上面左右分屏后按`<C-w><S-l>`即可恢复                                                                                                                                                                                         |
| 一行很长，需要一直按`w`或者`e` | 1. 使用插件`vim-matchup` 可以用 `z%` 快速跳转<br>2. 使用插件`eyeliner.nvim`可以高亮字符方便`f` |
| 想要用GBrowse分享代码段 | 使用插件`rhubarb.vim` |
| 在if或者for loop conditional中想复制这一段代码 | 1. 可以通过设置tresitter copy condition来实现，如果使用lazyvim，可以参考 [这篇](https://github.com/LazyVim/LazyVim/issues/282#issuecomment-1433300058) 来覆盖 <br>2. lazyvim目前使用mini.ai的textobj，所以可以直接`yao`来copy一个conditional block |
| 想要覆盖lazy vim中某些插件的配置 | [init = function()即可](https://github.com/LazyVim/LazyVim/issues/282#issuecomment-1433300058) |
| 如何像在sublime和vscode一样全局搜索代码 | 1. 使用插件`ctrlsf.vim` <br>2. 使用插件`nvim-spectre` |
| substitute有时候要输入很多转义字符，很麻烦 | 可以用magic和very magic模式，也就是\v |
| 如何substitute swap | 1. `:%s/\v(foo|bar)/\={'foo':'bar','bar':'foo'}[submatch(0)]/g` <br>2. `:s/map[\(.*)]\(.*)/map[\2]\1/g` <br>3. `:s/a.*/"&"<CR>ZZ` |
| 不想让lsp自动格式化文件 | 方法1. [在init.lua加入这些代码，把nvim_lsp改成require("lspconfig")](https://github.com/bmewburn/vscode-intelephense/issues/2003#issuecomment-1555040833) <br>方法2. [disable auto format of lsp](https://www.reddit.com/r/neovim/comments/12rn5zr/disable_autoformat_in_lazyvim/) |
| nvim 用dbext或dadbod时查询出来的结果是乱码 | 其实是本机mysql client的问题，需要按block2配置/etc/my.cnf |
| * 同一个项目可能需要多个分支来开发不同功能，切环境总是麻烦 | 可以使用nvim的auto-session和session-len插件来管理多session，用git worktree来管理多分支环境，用lazygit最新版来可视化管理worktree |
| * 有多个split窗口时，有时想全屏其中一个窗口但不关闭其它窗口进行开发或展示（类似:on，但:on会关闭其它窗口） | 使用插件'szw/vim-maximizer'可以做到 |
| 有多个monitors时，很难切换focus的monitor，需要用鼠标 | 可以用yabai+skhd，快捷键配置参考block3 |

### shell

| 痛点 | 解决 |
|-----|------|
| 在shell环境想要cd到有很多名称相似的目录会很麻烦，<br>比如有4个目录: /etc/a_b, /etc/a_b_c, /etc/a_b_e, /etc/a_e 。<br>这里想进入/etc/a_b_e, 就不得不完整输入路径，而不能使用自动补全 | 1. bash+fzf: `cd $(find . -type d | fzf )` ; `find . -type d | fzf | read dir && cd "$dir"` 具体操作见block1 <br>2. autojump或者 [zoxide](https://github.com/ajeetdsouza/zoxide)<br>3. linux杀招cdpath: `export CDPATH=$HOME:$HOME/project:$HOME/project/container/alb-container:$HOME/sidepro` |

**block1**

bash:

> 这里 fd -I 可以搜索git ignore的文件，-u可以搜索隐藏文件

```bash
# require fzf, fd-find
brew install fd
brew install fzf

# 在~/.bash_profile添加一下code
function ccd() {
  cd $(fd -L -I -t d . "${1:-.}" | fzf --height 10)
}
function lsd() {
  ls $(fd -L -I -t d . "${1:-.}" | fzf --height 10)
}
function lld() {
  ls -l $(fd -L -I -t d . "${1:-.}" | fzf --height 10)
}
function taild() {
  local cmd="tail"
  if [[ "$1" == "-f" ]]; then
    cmd="tail -f"
    shift
  fi
  if [[ "$1" == "-n" ]]; then
    cmd="tail -n $2"
    shift 2
  fi
  local selected_dir
  selected_dir=$(fd -L -I -t f . "${1:-.}" | fzf --height 10)
  eval $cmd "$selected_dir"
}
```

zsh 更完善版:

``` zsh
function ccd() {
  print -z "cd $(fd -I -L -t d . "${1:-.}" | fzf --height 10)"
}
function lsd() {
  print -z "ls $(fd -I -L -t d . "${1:-.}" | fzf --height 10)"
}
function lld() {
  print -z "ls -l $(fd -I -L -t d . "${1:-.}" | fzf --height 10)"
}
function catd() {
  print -z "cat $(fd -I -L -t f . "${1:-.}" | fzf --height 10)"
}
function taild() {
  local selected_dir
  selected_dir=$(fd -I -L -t f . "${@[$#]}" | fzf --height 10)
  print -z "tail $@[1,-2] $selected_dir"
}
```

后续可考虑加上缓存，加速搜索。以及支持隐藏目录。

**block2**

``` cnf
[client]
default-character-set=utf8

[mysql]
default-character-set=utf8


[mysqld]
collation-server = utf8_unicode_ci
init-connect='SET NAMES utf8'
character-set-server = utf8
```

**block3**

安装过程：https://www.josean.com/posts/yabai-setup

```cnf
cmd - h : yabai -m window --focus west || yabai -m display --focus west
cmd - j : yabai -m window --focus south || yabai -m display --focus south
cmd - k : yabai -m window --focus north || yabai -m display --focus north
cmd - l : yabai -m window --focus east || yabai -m display --focus east
```

## 未妥善解决

| 痛点                                                                    | 解决（暂定）                                                |
|-------------------------------------------------------------------------|-------------------------------------------------------------|
| Telescope Preview 拷贝/修改文本                                         | --                                                          |
| 从terminal更新代码（`go gen` or `git checkout`）时 nvim 的 lsp 不能识别 | 重启 nvim，对于 git 可以在 nvim 内用 fugitive checkout 分支 |
| 在ipad上使用nvim时yank不到系统剪切板                                    | --                                                          |
| auto cmp 对 grep 不起作用                                               | --                                                          |
| yank a function 后 paste 在两个方法中间，上下没有空行，需手动加         | formator                                                    |
| 小窗口打开文件树会占掉大半个屏幕                                        | 据说可以按照百分比，但不晓得lazyvim怎么配  (可以用mini-files代替)                  |
| tmux 多个 nvim pane，无法知晓哪个pane对应哪个目录或文件                 | 应该可以在 nvim 底部状态栏加上目录标示                      |


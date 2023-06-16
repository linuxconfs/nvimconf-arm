# 痛点

## 已解决

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

## 未妥善解决

| 痛点                                                                    | 解决（暂定）                                                |
|-------------------------------------------------------------------------|-------------------------------------------------------------|
| Telescope Preview 拷贝/修改文本                                         | --                                                          |
| 从terminal更新代码（`go gen` or `git checkout`）时 nvim 的 lsp 不能识别 | 重启 nvim，对于 git 可以在 nvim 内用 fugitive checkout 分支 |
| 在ipad上使用nvim时yank不到系统剪切板                                    | --                                                          |
| auto cmp 对 grep 不起作用                                               | --                                                          |
| yank a function 后 paste 在两个方法中间，上下没有空行，需手动加         | formator                                                    |
| 小窗口打开文件树会占掉大半个屏幕                                        | 据说可以按照百分比，但不晓得lazyvim怎么配                   |
| tmux 多个 nvim pane，无法知晓哪个pane对应哪个目录或文件                 | 应该可以在 nvim 底部状态栏加上目录标示                      |


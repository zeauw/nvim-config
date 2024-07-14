# 简介

本人自用的neovim配置。

# 使用

安装neovim后将本项目clone到```~/.config/nvim```文件夹。随后打开nvim等待第一次配置。（注：首次配置需要从github clone插件，请确保你的网络环境可以访问github）

# 配置说明

## lsp

根据自己的需求修改```lua/lsp.lua```。可通过[这个链接](https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers)查看支持的lsp，通过[这个链接](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)查看某个lsp服务需要在系统上安装什么前置。

## copilot

需要nodejs才能使用copilot。

## orgmode

在```lua/org-conf.lua```按自己的需求配置相关文件路径，写入
```lua
require('orgmode').setup({
  org_agenda_files = {'~/Documents/org/*','~/Documents/org/**/*'}, -- 替换为你的日程文件所在目录
  org_default_notes_file = '~/Documents/org/refile.org',
})
```

## 字体

终端字体需支持nerd字体，以显示图标。

## 剪切板

需要安装xclip包（X11）或wl-clipboard包（Wayland）以访问系统剪切板。

# 常用快捷键及备注

```<CR>```默认为回车，```<Leader>```默认为\，```<C+x>```为Ctrl+x，```<A+x>```为Alt+x

## 填充

- ```<CR>```：确认填充
- ```<Tab>```：在项目中滚动

## 窗口操作

- ```<C-h（或j/k/l）>```：在窗口间移动
- ```<C-Up（或Down）>```：减小（或增加）窗口垂直大小（这在上方的窗口操作自然）
- ```<C-Left（或Right）>```：减小（或增加）窗口水平大小（这在左边的窗口操作自然）

## 文件列表

- ```<A-t>```：开关文件列表

## copilot

注：copilot默认被disable，可使用```:Copilot enable```启用。
- ```<A-c>```：打开copilot的aigc内容选择面板

## neogit

- ```<A-g>```：打开neogit页面

## telescope

会自动识别项目，通常带```.git```文件夹的文件夹会被识别称项目，详情请查阅[这里](https://github.com/ahmedkhalf/project.nvim)

- ```<Leader>ff```：查找文件
- ```<Leader>fp```：查找项目

## table mode

先激活table mode，激活后，对于一个表，先写表头```|列1|列2|```（过程中输入|时会自动调整空格），回车后输入```||```，即可生成第二行（分隔符），后面只需输入```|内容|内容|```，在输入|时会自动调整表的布局。
- ```<Leader>tm```：激活table mode

## orgmode

- ```<Leader>oa```：打开日程
- ```<Leader>oc```：打开capture
- ```<Leader>o,```：选择优先级
- ```cit```：轮换todo状态
- ```<TAB>```：轮换折叠状态
- ```<Leader>oid```：添加deadline
- ```<Leader>ois```：添加schedule
- ```<Leader>ot```：添加tag
- ```<Leader>oA```：添加"ARCHIVE" tag

## 插件管理/lsp管理

- 使用Lazy管理插件，```:Lazy```
- 使用mason管理lsp：```:Mason```

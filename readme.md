# 简介

本人自用的neovim配置。

# 使用

安装neovim后将本项目clone到```~/.config/nvim```文件夹。随后打开nvim等待第一次配置。（注：首次配置需要从github clone插件，请确保你的网络环境可以访问github）

# 配置说明

## lsp

使用```:LspInstall```安装 lsp。

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

# tree-sitter

部分语言的 tree-sitter 需要安装 tree-sitter cli 才能安装上。

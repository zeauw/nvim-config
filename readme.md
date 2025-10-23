# Neovim 配置说明

本人自用的 Neovim 配置，基于 Lua 和 lazy.nvim 插件管理器。

## 目录

- [快速开始](#快速开始)
- [插件功能介绍](#插件功能介绍)
- [快捷键说明](#快捷键说明)
- [新设备配置步骤](#新设备配置步骤)
- [常见问题](#常见问题)

---

## 快速开始

### 前置依赖

- Neovim >= 0.9.0
- Git
- Node.js >= 16.x（Copilot 需要）
- 支持 Nerd Fonts 的终端字体
- 系统剪切板工具：
  - X11: `xclip`
  - Wayland: `wl-clipboard`

### 安装

```bash
# 1. 克隆配置到 neovim 配置目录
git clone https://github.com/zeauw/nvim-config ~/.config/nvim

# 2. 打开 neovim，自动安装插件
nvim
```

首次打开会自动下载并安装所有插件，请确保网络能访问 GitHub。

---

## 插件功能介绍

### 核心功能

#### 1. **插件管理** (lazy.nvim)
- 自动化的插件安装和更新
- 延迟加载，提升启动速度

#### 2. **文件浏览** (nvim-tree.lua)
- 侧边栏文件树
- 支持文件/目录的创建、删除、重命名等操作

#### 3. **模糊搜索** (telescope.nvim)
- 文件搜索
- 文本内容搜索（live grep）
- 项目切换
- LSP 符号搜索
- 文件浏览器

#### 4. **LSP 支持** (nvim-lspconfig + mason.nvim)
- 代码补全
- 跳转定义
- 代码诊断
- 代码重命名
- 自动安装 LSP 服务器

#### 5. **自动补全** (nvim-cmp)
- LSP 源补全
- Buffer 补全
- Path 补全
- Snippet 补全
- Orgmode 补全

#### 6. **代码片段** (LuaSnip)
- 快速插入常用代码模板
- LaTeX 片段支持（luasnip-latex-snippets）

#### 7. **Git 集成**
- **Gitsigns**: Git 状态显示
- **Neogit**: Git 操作界面（类 Magit）
- **Diffview**: 差异对比视图

#### 8. **调试支持** (nvim-dap + nvim-dap-ui)
- Python 调试（debugpy）
- C/C++ 调试（GDB）
- 可视化调试界面
- 断点管理

#### 9. **代码格式化** (formatter.nvim)
- Lua 格式化（luaformat）
- Python 格式化（ruff）
- 自动删除行尾空格

#### 10. **交互式 REPL** (iron.nvim)
- Python（IPython）
- Bash
- 支持发送代码到 REPL 执行

#### 11. **语法高亮** (nvim-treesitter)
- 基于 Tree-sitter 的语法高亮
- 自动安装语言解析器

#### 12. **AI 辅助编程** (copilot.vim + CopilotChat.nvim)
- GitHub Copilot 代码补全
- AI 代码聊天助手

#### 13. **笔记和文档**
- **Orgmode**: Org 文件支持，日程管理
- **Markdown**: 渲染和图片粘贴支持
- **Zk**: Zettelkasten 笔记管理

#### 14. **其他实用工具**
- **Bufferline**: 顶部 buffer 标签栏
- **Lualine**: 底部状态栏
- **Comment.nvim**: 快速注释
- **Trouble.nvim**: 诊断和问题列表
- **Which-key**: 快捷键提示
- **vim-table-mode**: 表格编辑模式
- **im-select**: 自动切换输入法
- **image.nvim**: 终端内图片显示

---

## 快捷键说明

> Leader 键设置为默认值（通常是 `\` 或 `空格`）

### 窗口导航

| 快捷键 | 功能 |
|--------|------|
| `Ctrl + ←` | 跳转到左侧窗口 |
| `Ctrl + ↓` | 跳转到下方窗口 |
| `Ctrl + ↑` | 跳转到上方窗口 |
| `Ctrl + →` | 跳转到右侧窗口 |

### 文件浏览

| 快捷键 | 功能 |
|--------|------|
| `<Leader>ls` | 切换文件树 (NvimTree) |
| `<Leader>ff` | 搜索文件 |
| `<Leader>fp` | 切换项目 |
| `<Leader>fg` | 全局文本搜索 (live grep) |
| `<Leader>fs` | 搜索当前文档符号 |
| `<Leader>fb` | 文件浏览器 |
| `<Leader>se` | 当前 buffer 模糊搜索 |

### Git 操作

| 快捷键 | 功能 |
|--------|------|
| `<Leader>gi` | 打开 Neogit |

### AI 辅助 (Copilot)

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `<Leader>co` | Normal/Visual | 打开 CopilotChat |

> 注意：Copilot 默认禁用，需要手动启用

### 调试 (DAP)

| 快捷键 | 功能 |
|--------|------|
| `F5` | 继续执行 |
| `F10` | 单步跳过 |
| `F11` | 单步进入 |
| `F12` | 单步跳出 |
| `<Leader>b` | 切换断点 |
| `<Leader>B` | 设置断点 |
| `<Leader>lp` | 设置日志断点 |
| `<Leader>dr` | 打开 REPL |
| `<Leader>dl` | 运行上次配置 |
| `<Leader>da` | 切换调试 UI |

### 代码编辑

| 快捷键 | 功能 |
|--------|------|
| `<Leader>rn` | LSP 重命名 |
| `<Leader>sd` | 显示诊断信息 |
| `<Leader>fm` | 格式化代码 |
| `<Leader>fw` | 格式化并保存 |

### 问题诊断 (Trouble)

| 快捷键 | 功能 |
|--------|------|
| `<Leader>xx` | 切换诊断列表 |
| `<Leader>xX` | 当前 buffer 诊断 |
| `<Leader>cs` | 符号列表 |
| `<Leader>cl` | LSP 定义/引用 |
| `<Leader>xL` | 位置列表 |
| `<Leader>xQ` | Quickfix 列表 |

### REPL 交互 (Iron)

| 快捷键 | 功能 |
|--------|------|
| `<Space>rs` | 打开 REPL |
| `<Space>rr` | 重启 REPL |
| `<Space>rf` | 聚焦 REPL |
| `<Space>rh` | 隐藏 REPL |
| `<Space>sc` | 发送选中代码 |
| `<Space>sl` | 发送当前行 |
| `<Space>sf` | 发送整个文件 |
| `<Space>sp` | 发送段落 |
| `<Space>su` | 发送到光标 |
| `<Space>sq` | 退出 REPL |
| `<Space>cl` | 清空 REPL |

### 终端

| 快捷键 | 功能 |
|--------|------|
| `<Leader>tv` | 垂直分割打开终端 |
| `<Leader>ts` | 水平分割打开终端 |
| `Esc` (终端模式) | 退出终端模式 |

### 其他

| 快捷键 | 功能 |
|--------|------|
| `<Leader>?` | 显示 buffer 局部快捷键 |
| `<Leader>pi` | 从剪切板粘贴图片 |

### 自动补全 (nvim-cmp)

| 快捷键 | 功能 |
|--------|------|
| `Tab` | 选择下一个补全项 / 跳转 snippet |
| `Ctrl + Space` | 触发补全 |
| `Ctrl + b` | 向上滚动文档 |
| `Ctrl + f` | 向下滚动文档 |
| `Ctrl + e` | 取消补全 |
| `Enter` | 确认补全 |

---

## 新设备配置步骤

### 1. 安装基础依赖

#### Ubuntu/Debian
```bash
# 安装 Neovim（最新版）
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim

# 安装基础工具
sudo apt install git nodejs npm xclip ripgrep fd-find

# 安装 Python 工具
pip install ruff debugpy ipython
```

#### Arch Linux
```bash
sudo pacman -S neovim git nodejs npm xclip ripgrep fd
pip install ruff debugpy ipython
```

#### macOS
```bash
brew install neovim git node ripgrep fd
pip3 install ruff debugpy ipython
```

### 2. 安装 Nerd Fonts

```bash
# 下载并安装 Nerd Font（推荐 JetBrainsMono Nerd Font）
# 访问 https://www.nerdfonts.com/font-downloads
# 或使用以下命令快速安装
brew install --cask font-jetbrains-mono-nerd-font  # macOS
```

在终端设置中将字体改为安装的 Nerd Font。

### 3. 克隆配置

```bash
# 备份现有配置（如果有）
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup

# 克隆本配置
git clone https://github.com/zeauw/nvim-config ~/.config/nvim
```

### 4. 首次启动

```bash
# 启动 Neovim，等待插件自动安装
nvim
```

首次启动会：
- 自动下载 lazy.nvim 插件管理器
- 安装所有配置的插件
- 可能需要 2-5 分钟

### 5. 安装 LSP 服务器

打开 Neovim 后：

```vim
" 安装常用的 LSP 服务器
:LspInstall pyright        " Python
:LspInstall lua_ls         " Lua
:LspInstall clangd         " C/C++
:LspInstall tsserver       " TypeScript/JavaScript
```

或直接打开对应语言的文件，Mason 会提示自动安装。

### 6. 配置 Copilot（可选）

```vim
" 在 Neovim 中运行
:Copilot setup
```

按照提示登录 GitHub 账号并授权。

如需启用 Copilot：
```vim
:set g:copilot_enabled=true
" 或在配置文件中修改 lua/preferences.lua
```

### 7. 配置 Orgmode（可选）

编辑 `~/.config/nvim/lua/org-conf.lua`：

```lua
require('orgmode').setup({
  org_agenda_files = {'~/Documents/org/*', '~/Documents/org/**/*'},
  org_default_notes_file = '~/Documents/org/refile.org',
})
```

创建对应的目录：
```bash
mkdir -p ~/Documents/org
```

### 8. 配置调试器

#### Python 调试器
```bash
# debugpy 已通过 Mason 安装
# 无需额外配置
```

#### C/C++ 调试器
```bash
# 安装 GDB
sudo apt install gdb  # Ubuntu/Debian
sudo pacman -S gdb    # Arch
brew install gdb      # macOS
```

### 9. 验证安装

打开 Neovim 并运行：

```vim
:checkhealth
```

检查所有功能是否正常。常见问题会在这里显示。

---

## 常见问题

### 1. 插件安装失败

**问题**：网络问题导致无法从 GitHub 下载插件

**解决**：
- 配置 Git 代理：`git config --global http.proxy http://127.0.0.1:7890`
- 或使用镜像站（修改 `lua/plugins.lua` 中的插件源）

### 2. 图标显示异常

**问题**：文件树、状态栏显示方块或乱码

**解决**：
- 确保终端字体设置为 Nerd Font
- 推荐：JetBrainsMono Nerd Font, FiraCode Nerd Font

### 3. 剪切板不工作

**问题**：无法复制到系统剪切板

**解决**：
```bash
# X11
sudo apt install xclip

# Wayland
sudo apt install wl-clipboard
```

### 4. Tree-sitter 解析器安装失败

**问题**：部分语言的语法高亮不工作

**解决**：
```bash
# 安装 tree-sitter CLI
npm install -g tree-sitter-cli

# 在 Neovim 中手动安装
:TSInstall python lua c cpp
```

### 5. LSP 不工作

**问题**：代码补全、跳转等功能失效

**解决**：
```vim
" 检查 LSP 状态
:LspInfo

" 重新安装 LSP
:LspInstall <language>

" 检查 Mason
:Mason
```

### 6. Copilot 不生效

**问题**：无代码建议

**解决**：
```vim
" 检查 Copilot 状态
:Copilot status

" 重新认证
:Copilot setup

" 启用 Copilot（默认禁用）
:let g:copilot_enabled = v:true
```

### 7. Python 调试器找不到

**问题**：DAP 无法启动 Python 调试

**解决**：
```bash
# 确保 debugpy 已安装
pip install debugpy

# 或通过 Mason 安装
:MasonInstall debugpy
```

### 8. 格式化工具未安装

**问题**：`:Format` 命令不工作

**解决**：
```bash
# Python
pip install ruff

# Lua
luarocks install luaformatter
# 或
npm install -g lua-fmt
```

---

## 自定义配置

### 修改配色方案

编辑 `lua/colorscheme.lua`，当前使用 Nord 主题。

### 修改快捷键

编辑 `lua/preferences.lua`，在文件中添加或修改快捷键映射。

### 添加新插件

编辑 `lua/plugins.lua`，在 `require("lazy").setup({})` 中添加插件配置。

### 配置特定语言的 LSP

编辑 `lua/cmp-conf.lua` 或创建新的配置文件。

---

## 维护和更新

### 更新插件

```vim
" 更新所有插件
:Lazy sync

" 查看插件状态
:Lazy
```

### 更新配置

```bash
cd ~/.config/nvim
git pull
```

### 清理缓存

```bash
# 清理插件缓存
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

---

## 项目结构

```
~/.config/nvim/
├── init.lua                    # 入口文件
├── lua/
│   ├── plugins.lua             # 插件配置
│   ├── preferences.lua         # 基础设置和快捷键
│   ├── colorscheme.lua         # 配色方案
│   ├── cmp-conf.lua           # 自动补全配置
│   ├── dap-conf.lua           # 调试器配置
│   ├── fmt-conf.lua           # 格式化配置
│   ├── iron-conf.lua          # REPL 配置
│   ├── org-conf.lua           # Orgmode 配置
│   ├── neogit-conf.lua        # Git 配置
│   ├── bufferline-conf.lua    # Buffer 栏配置
│   ├── lualine-conf.lua       # 状态栏配置
│   └── render-markdow-conf.lua # Markdown 配置
└── readme.md                   # 本文档
```

---

## 贡献

欢迎提交 Issue 和 Pull Request！

## 许可证

本配置基于个人使用，随意使用和修改。

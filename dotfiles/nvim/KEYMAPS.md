# Neovim Keymaps Cheatsheet

> **Leader Key**: `Space`
> **Timeout**: 300ms (time to wait after pressing prefix key)

---

## 📋 Table of Contents

1. [Basic Operations](#1-basic-operations)
2. [Window Management](#2-window-management)
3. [Tabs & Buffers](#3-tabs--buffers)
4. [File Explorer](#4-file-explorer-nvimtree)
5. [Search](#5-search-telescope)
6. [LSP Features](#6-lsp-features)
7. [Diagnostics](#7-diagnostics-trouble)
8. [Git Operations](#8-git-operations)
9. [Debugging](#9-debugging-dap)
10. [Code Editing](#10-code-editing)
11. [Terminal](#11-terminal)

---

## 1. Basic Operations

### Mode Switching

| Keymap  | Mode   | Description                        |
| ------- | ------ | ---------------------------------- |
| `jk`    | Insert | Exit insert mode (same as `<Esc>`) |
| `i`     | Normal | Enter insert mode (before cursor)  |
| `a`     | Normal | Enter insert mode (after cursor)   |
| `v`     | Normal | Enter visual mode                  |
| `V`     | Normal | Enter line visual mode             |
| `<C-v>` | Normal | Enter block visual mode            |

### Common Operations

| Keymap       | Mode   | Description             |
| ------------ | ------ | ----------------------- |
| `<leader>nh` | Normal | Clear search highlights |
| `<leader>+`  | Normal | Increment number        |
| `<leader>-`  | Normal | Decrement number        |
| `u`          | Normal | Undo                    |
| `<C-r>`      | Normal | Redo                    |
| `.`          | Normal | Repeat last operation   |

### Move Text ,Alt

| Keymap     | Mode   | Description              |
| ---------- | ------ | ------------------------ |
| `<A-Up>`   | Normal | Move current line up     |
| `<A-Down>` | Normal | Move current line down   |
| `<A-Up>`   | Visual | Move selected lines up   |
| `<A-Down>` | Visual | Move selected lines down |

---

## 2. Window Management

### Split Windows

| Keymap       | Mode   | Description                 |
| ------------ | ------ | --------------------------- |
| `<leader>sv` | Normal | Split window vertically     |
| `<leader>sh` | Normal | Split window horizontally   |
| `<leader>se` | Normal | Make all windows equal size |
| `<leader>sx` | Normal | Close current window        |

### Resize Windows

| Keymap      | Mode   | Description                 |
| ----------- | ------ | --------------------------- |
| `<C-Up>`    | Normal | Decrease window height by 2 |
| `<C-Down>`  | Normal | Increase window height by 2 |
| `<C-Left>`  | Normal | Decrease window width by 2  |
| `<C-Right>` | Normal | Increase window width by 2  |

### Navigate Windows

| Keymap  | Mode   | Description         |
| ------- | ------ | ------------------- |
| `<C-h>` | Normal | Go to left window   |
| `<C-j>` | Normal | Go to bottom window |
| `<C-k>` | Normal | Go to top window    |
| `<C-l>` | Normal | Go to right window  |

---

## 3. Tabs & Buffers

### Tabs

| Keymap       | Mode   | Description                  |
| ------------ | ------ | ---------------------------- |
| `<leader>to` | Normal | Open new tab                 |
| `<leader>tx` | Normal | Close current tab            |
| `<leader>tn` | Normal | Go to next tab               |
| `<leader>tp` | Normal | Go to previous tab           |
| `<leader>tf` | Normal | Open current file in new tab |

### Buffers

| Keymap       | Mode   | Description           |
| ------------ | ------ | --------------------- |
| `<leader>bn` | Normal | Go to next buffer     |
| `<leader>bp` | Normal | Go to previous buffer |
| `<leader>bd` | Normal | Delete current buffer |

---

## 4. File Explorer (NvimTree)

| Keymap       | Mode   | Description                   |
| ------------ | ------ | ----------------------------- |
| `<leader>ee` | Normal | Toggle file explorer          |
| `<leader>ef` | Normal | Find current file in explorer |
| `<leader>ec` | Normal | Collapse all directories      |
| `<leader>er` | Normal | Refresh file explorer         |

### NvimTree Internal Keymaps

| Keymap       | Description               |
| ------------ | ------------------------- |
| `<CR>` / `o` | Open file/directory       |
| `<Tab>`      | Preview file              |
| `a`          | Create new file/directory |
| `d`          | Delete                    |
| `r`          | Rename                    |
| `x`          | Cut                       |
| `c`          | Copy                      |
| `p`          | Paste                     |
| `y`          | Copy filename             |
| `Y`          | Copy relative path        |
| `gy`         | Copy absolute path        |
| `H`          | Toggle hidden files       |
| `R`          | Refresh                   |
| `?`          | Help                      |

---

## 5. Search (Telescope)

### Global Search

| Keymap       | Mode   | Description                |
| ------------ | ------ | -------------------------- |
| `<leader>ff` | Normal | Find files                 |
| `<leader>fr` | Normal | Find recent files          |
| `<leader>fs` | Normal | Live grep (search string)  |
| `<leader>fc` | Normal | Search string under cursor |
| `<leader>ft` | Normal | Find TODO comments         |
| `q:`         | Normal | Command history            |

### Telescope Internal Keymaps

| Keymap  | Mode   | Description       |
| ------- | ------ | ----------------- |
| `<C-j>` | Insert | Next result       |
| `<C-k>` | Insert | Previous result   |
| `<C-q>` | Insert | Send to quickfix  |
| `<C-t>` | Insert | Open in Trouble   |
| `<CR>`  | Insert | Confirm selection |
| `<Esc>` | Insert | Close             |

---

## 6. LSP Features

### Navigation

| Keymap | Mode   | Description           |
| ------ | ------ | --------------------- |
| `gd`   | Normal | Go to definition      |
| `gD`   | Normal | Go to declaration     |
| `gR`   | Normal | Show references       |
| `gi`   | Normal | Show implementations  |
| `gt`   | Normal | Show type definitions |

### Code Actions

| Keymap       | Mode          | Description              |
| ------------ | ------------- | ------------------------ |
| `K`          | Normal        | Show hover documentation |
| `<leader>ca` | Normal/Visual | Code action              |
| `<leader>rn` | Normal        | Smart rename             |
| `<leader>rs` | Normal        | Restart LSP              |

### Diagnostics

| Keymap      | Mode   | Description             |
| ----------- | ------ | ----------------------- |
| `<leader>d` | Normal | Show line diagnostics   |
| `<leader>D` | Normal | Show buffer diagnostics |
| `[d`        | Normal | Previous diagnostic     |
| `]d`        | Normal | Next diagnostic         |

---

## 7. Diagnostics (Trouble)

| Keymap       | Mode   | Description           |
| ------------ | ------ | --------------------- |
| `<leader>xw` | Normal | Workspace diagnostics |
| `<leader>xd` | Normal | Document diagnostics  |
| `<leader>xq` | Normal | Quickfix list         |
| `<leader>xl` | Normal | Location list         |
| `<leader>xt` | Normal | TODO list             |

---

## 8. Git Operations

### Hunk Operations (Gitsigns)

| Keymap       | Mode          | Description         |
| ------------ | ------------- | ------------------- |
| `]c`         | Normal        | Next hunk           |
| `[c`         | Normal        | Previous hunk       |
| `<leader>hs` | Normal/Visual | Stage hunk          |
| `<leader>hr` | Normal/Visual | Reset hunk          |
| `<leader>hS` | Normal        | Stage buffer        |
| `<leader>hR` | Normal        | Reset buffer        |
| `<leader>hp` | Normal        | Preview hunk        |
| `<leader>hi` | Normal        | Preview hunk inline |

### Blame & Diff

| Keymap       | Mode   | Description          |
| ------------ | ------ | -------------------- |
| `<leader>hb` | Normal | Show blame           |
| `<leader>hd` | Normal | Diff this            |
| `<leader>hD` | Normal | Diff against ~       |
| `<leader>hq` | Normal | Send to quickfix     |
| `<leader>hQ` | Normal | Send all to quickfix |

### Toggles

| Keymap       | Mode   | Description       |
| ------------ | ------ | ----------------- |
| `<leader>tb` | Normal | Toggle line blame |
| `<leader>tw` | Normal | Toggle word diff  |

### LazyGit

| Keymap       | Mode   | Description  |
| ------------ | ------ | ------------ |
| `<leader>lg` | Normal | Open LazyGit |

### Text Object

| Keymap | Mode            | Description |
| ------ | --------------- | ----------- |
| `ih`   | Operator/Visual | Select hunk |

---

## 9. Debugging (DAP)

### Debug Control

| Keymap | Mode   | Description    |
| ------ | ------ | -------------- |
| `<F5>` | Normal | Start/Continue |
| `<F6>` | Normal | Stop           |
| `<F7>` | Normal | Toggle DAP UI  |

### Step Execution

| Keymap | Mode   | Description |
| ------ | ------ | ----------- |
| `<F1>` | Normal | Step Into   |
| `<F2>` | Normal | Step Over   |
| `<F3>` | Normal | Step Out    |

### Breakpoints

| Keymap       | Mode   | Description                |
| ------------ | ------ | -------------------------- |
| `<leader>bb` | Normal | Toggle breakpoint          |
| `<leader>bB` | Normal | Set conditional breakpoint |

---

## 10. Code Editing

### Format & Lint

| Keymap       | Mode          | Description  |
| ------------ | ------------- | ------------ |
| `<leader>mp` | Normal/Visual | Format code  |
| `<leader>ll` | Normal        | Trigger lint |

### Comment (Comment.nvim)

| Keymap       | Mode   | Description                     |
| ------------ | ------ | ------------------------------- |
| `gcc`        | Normal | Toggle line comment             |
| `gc{motion}` | Normal | Toggle comment for motion       |
| `gc`         | Visual | Toggle comment for selection    |
| `gbc`        | Normal | Toggle block comment            |
| `gb{motion}` | Normal | Toggle block comment for motion |
| `gco`        | Normal | Insert comment below            |
| `gcO`        | Normal | Insert comment above            |
| `gcA`        | Normal | Insert comment at end of line   |

### Substitute (Substitute.nvim)

| Keymap      | Mode   | Description               |
| ----------- | ------ | ------------------------- |
| `s{motion}` | Normal | Substitute motion range   |
| `ss`        | Normal | Substitute line           |
| `S`         | Normal | Substitute to end of line |
| `s`         | Visual | Substitute selection      |

### Surround (nvim-surround)

| Keymap             | Mode   | Description                          |
| ------------------ | ------ | ------------------------------------ |
| `ys{motion}{char}` | Normal | Add surrounding                      |
| `yss{char}`        | Normal | Add surrounding to line              |
| `yS{motion}{char}` | Normal | Add surrounding on new lines         |
| `ySS{char}`        | Normal | Add surrounding to line on new lines |
| `ds{char}`         | Normal | Delete surrounding                   |
| `cs{old}{new}`     | Normal | Change surrounding                   |

**Examples**:

- `ysiw"` → Add quotes: `word` → `"word"`
- `ds"` → Delete quotes: `"word"` → `word`
- `cs"'` → Change quotes: `"word"` → `'word'`

### Treesitter Incremental Selection

| Keymap        | Mode   | Description            |
| ------------- | ------ | ---------------------- |
| `<C-Space>`   | Normal | Start/Expand selection |
| `<Backspace>` | Visual | Shrink selection       |

---

## 11. Terminal

| Keymap  | Mode   | Description       |
| ------- | ------ | ----------------- |
| `<A-1>` | Normal | Toggle terminal 1 |
| `<A-2>` | Normal | Toggle terminal 2 |
| `<A-3>` | Normal | Toggle terminal 3 |

---

## 📌 Prefix Quick Reference

| Prefix      | Meaning                     | Related Features   |
| ----------- | --------------------------- | ------------------ |
| `<leader>b` | **B**uffer / **B**reakpoint | Buffer, Breakpoint |
| `<leader>c` | **C**ode                    | Code actions       |
| `<leader>d` | **D**iagnostics             | Diagnostics        |
| `<leader>e` | **E**xplorer                | File explorer      |
| `<leader>f` | **F**ind                    | Search             |
| `<leader>h` | **H**unk                    | Git hunks          |
| `<leader>l` | **L**int / **L**azyGit      | Lint, Git          |
| `<leader>m` | **M**ake pretty             | Format             |
| `<leader>n` | **N**o highlight            | Clear highlight    |
| `<leader>r` | **R**ename / **R**estart    | Rename, Restart    |
| `<leader>s` | **S**plit                   | Window split       |
| `<leader>t` | **T**ab / **T**oggle        | Tab, Toggle        |
| `<leader>x` | E**x**tra / Trouble         | Diagnostics list   |

---

## 💡 Tips

1. **Press `<leader>` and wait** - which-key will show available keymaps
2. **Overlapping warnings are normal** - `s`/`ss`, `gc`/`gcc` are designed this way
3. **Timeout is 300ms** - You have 300ms to input subsequent keys after prefix
4. **`:checkhealth which-key`** - Check keymap configuration status

---

> 📅 Last Updated: 2026-02-03

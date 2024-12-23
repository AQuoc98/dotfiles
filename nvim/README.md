# Nvim

## Troubleshooting Notes for Neovim Setup

- Check generate health of Neovim setup. `:checkhealth`
- Update Treesitter. `:TSUpdate`
- Check LSP installation. `:Mason`
- Fix broken icons
  - Download [nerdfix](https://github.com/loichyan/nerdfix) binary and unpack in home directory.
  - Run `nerdfix check <path/to/file>` to check broken icons in a file
  - Run `nerdfix fix <path/to/file>` to fix broken icons in a file

## Key Commands

Document

- Cheatsheet: https://vim.rtorr.com/
- https://www.lazyvim.org/
- Plugins: https://vimawesome.com/
- Learn Lua: https://learnxinyminutes.com/lua/

Install support plugins:

- `brew install lazygit`
- Mason install manually
  - dart-debug-adapter

## Shortcuts

** VIM in vscode **

- `<S-h>`: tab previous
- `<S-l>`: tab next
- `visual mode - J || K`: move line up and down
- `< || >`: stay in indent mode
- `<leader>v`: split window vertically
- `<leader>s`: split window horizontally
- `<leader> h || j || k || l`: navigate between split

**Run script**

- Dart: dart run
- JS: node file.js

**Helpful nvim-treesitter-textobjects (vim motion)**

- Select

  - `aa` = '@parameter.outer'
  - `ia` = '@parameter.inner'
  - `af` = '@function.outer'
  - `if` = '@function.inner'
  - `ac` = '@class.outer'
  - `ic` = '@class.inner'

- Move

  - goto_next_start
    - `]m` = '@function.outer'
    - `]]` = '@class.outer'
  - goto_next_end
    - `]M` = '@function.outer'
    - `][` = '@class.outer'
  - goto_previous_start
    - `[m` = '@function.outer'
    - `[[` = '@class.outer'
  - goto_previous_end
    - `[M` = '@function.outer'
    - `[]` = '@class.outer'

- Swap
  - swap_next
    - `<leader>a` = '@parameter.inner'
  - swap_previous
    - `<leader>A` = '@parameter.inner'

**Default Keymap**

- `space`: leader

- Default

  - `jk`: quit insert mode
  - `esc`: clear highlight when search
  - `<leader>lw`: toggle line wrapping
  - resize with arrow
  - `<leader>+ || <leader>-`: increment/decrement number
  - `< || >`: stay in indent mode
  - `<A-j> || <A-k>`: move text up and down
  - `<leader>j`: replace word under cursor
  - `<C-o> || <C-i>`: next, previous action

- Diagnostics

  - `<leader>l`: trigger linting for current file
  - `<leader>do`: toggle
  - `[d`: go to previous diagnostic message
  - `]d`: go to next diagnostic message
  - `<leader>d`: open floating diagnostic message
  - `<leader>q`: open diagnostics list

- Session
  - `<leader>ss`: save
  - `<leader>sl`: load
  - `<leader>ls`: open list
- File

  - `<C-s>`: save file
  - `<C-q>`: quit file
  - `<leader>sn`: save file without auto-formatting
  - `<leader>mp`: format selection code

- Buffer

  - `<leader>x`: delete
  - `<leader>b`: new
  - `<Tab> || <S-Tab>`: switch

- Window management

  - `<leader>v`: split window vertically
  - `<leader>h`: split window horizontally
  - `<leader>se`: make split window equal width & height
  - `<leader>xs`: close current split window
  - `<C-j> || <C-k> || <C-l> || <C-h> || <C-\\>`: navigate between split

- Tab

  - `<leader>to`: open new tab
  - `<leader>tx`: close current tab
  - `<leader>tp || <leader>tn`: go to next / previous tab

- Find and replace

  ```
  :[range]s[ubstitute]/pattern/replacement/[flags] [count]
  ```

  ```
  - Example 1: Thay thế từ "foo" thành "bar" trong dòng hiện tại
  :s/foo/bar/

  - Example 2: Thay thế tất cả từ "foo" thành "bar" trong toàn bộ tệp
  :%s/foo/bar/g

  - Example 3: Hiển thị xác nhận trước khi thay thế
  :%s/foo/bar/gc

  y: agree, n: skip, a: replace all, q: exit command

  - Example 4: Thay thế trong một phạm vi dòng
  :10,20s/foo/bar/g

  - Example 5: Sử dụng biểu thức chính quy để thay thế
  :%s/\<foo\>/bar/g

  Explain: \< và \> xác định ranh giới từ (chỉ thay thế từ "foo" hoàn chỉnh, không thay thế "foobar" hoặc "foot")

  - Example 6: Tham chiếu nhóm trong biểu thức chính quy
  :%s/\(foo\)\(bar\)/\2\1/g

  Result: "foobar" sẽ trở thành "barfoo"

  - Example 7: Chỉ thay thế dòng đầu tiên của mỗi khớp
  :g/foo/s/foo/bar/

  - Example 8: Hiển thị số lượng thay thế mà không thực hiện
  :%s/foo/bar/n
  ```

  - Basic search and replace
    ```
    Step 1 - search text: /string
    Step 2 - change text: cgn + replace-string
    Step 3 - repeat action: .
    ```
  - Replacing the first occurrence of ‘original’ with ‘replacement’ in the current line: `:s/pattern/replacement/`
  - Replacing all occurrences of ‘original’ with ‘replacement’ across all lines in the file: `:%s/pattern/replacement/g`
  - Change in multiple file by Telescope
    ```
    Step 1 - search text by telescope
    Step 2 - add to quickfix list
    Step 3 - iterate on instance by cfdo command: :cfdo %s/old-char/new-char/g | update | bd
    ```

**Plugin**

- Neotree

  - `<leader>w`: float file exploer
  - `<leader>e`: left file exploer
  - `<leader>ngs`: open git status

- Comment

  - `gcc`: comment line
  - `gc - visual mode`: comment line
  - `gb - visual mode`: comment block

- Surround

  - `ys{motion}{char}`: add
  - `ds{char}`: delete
  - `cs{target}{replacement}`: change
  - use t char for html tag

- Theme

  - `<leader>bg`: toggle transparency

- Telescope

  - In mode
    - default
      - insert
        - `<C-/>`: show help
        - `<C-l>`: open file
      - normal
        - `q`: close
    - picker
      - normal
        - `d`: delete buffer
        - `l`: select default
  - Out mode
    - `:TodoTelescope`: search TODO comment
    - `<leader>?`: find recently opened files
    - `<leader>sb`: search existing Buffers
    - `<leader>sm`: search Marks
    - `<leader>gf`: search git file
    - `<leader>gc`: search git commits
    - `<leader>gcf`: search git commits for current file
    - `<leader>gb`: search git branches
    - `<leader>gs`: search git status
    - `<leader>sf`: search files
    - `<leader>sh`: search help
    - `<leader>sw`: search current word
    - `<leader>sg`: search by grep
    - `<leader>sd`: search diagnostics
    - `<leader>sr`: search resume
    - `<leader>s.`: search recent files
    - `<leader>sds`: seach LSP document symbols
    - `<leader><leader>`: find existing buffers
    - `<leader>s/`: search [/] in open files
    - `<leader>/`: [/] Fuzzily search in current buffer

- LSP

  - `gd`: jump to the definition, jump back `<C-T>`
  - `gr`: find references
  - `gI`: jump to the implementation
  - `<leader>D`: jump to the type
  - `<leader>ds`: fuzzy find all the symbols in your current document
  - `<leader>ws`: fuzzy find all the symbols in your current workspace
  - `<leader>rn`: rename the variable under your cursor
  - `<leader>ca`: execute a code action
  - `K`: opens a popup that displays documentation
  - `gD`: goto declaration
  - `<leader>wa`: workspace add folder
  - `<leader>wr`: workspace remove folder
  - `<leader>wl`: workspace list folders
  - other commands
    - `JsOrganizeImports`: organize imports

- Auto suggestion

  - `<C-j>`: select the next item
  - `<C-k>`: select the previous item
  - `<C-b>`: scroll doc
  - `<C-f>`: scroll doc
  - `<C-l>`: move you to the right of each of the expansion locations
  - `<C-h>`: moving you backwards of each of the expansion locations
  - `<C-c>`: manually trigger a completion from nvim-cmp
  - `<Tab> || <S-Tab>`: select next/previous item

- Git

  - `<leader>lg`: open lazygit
  - `:Git command-name`: use git in nvim
  - `]h`: next hunk
  - `[h`: prev hunk
  - `]H`: last hunk
  - `[H`: first hunk
  - `<leader>ghs`: stage hunk
  - `<leader>ghr`: reset hunk
  - `<leader>ghS`: stage buffer
  - `<leader>ghu`: undo stage hunk
  - `<leader>ghR`: reset buffer
  - `<leader>ghp`: preview hunk inline
  - `<leader>gtb`: blame buffer
  - `<leader>ghb`: blame line
  - `<leader>ghB`: blame buffer
  - `<leader>ghd`: diff this
  - `<leader>ghD`: diff this ~
  - `ih`: gitSigns select hunk

- Flutter Tools: `Flutter...`

- Live Server

  - `:LiveServerStart`: start the live server
  - `:LiveServerStop`: stop the live server

- Debug
  - `<F5>`: start/continue
  - `<F1>`: step into
  - `<F2>`: step over
  - `<F3>`: step out
  - `<leader>db`: toggle breakpoint
  - `<leader>dB`: set breakpoint
  - `<F7>`: see last session result

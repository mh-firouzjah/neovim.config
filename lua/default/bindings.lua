local bind = vim.keymap.set
local opts = { noremap = true, silent = true }
local silent = { silent = true }

-- Fire Explorer
local ok, nvimtree = pcall(require, "nvim-tree.config")

if ok then
    bind("n", "<leader>r", ":NvimTreeRefresh<CR>") -- nnoremap <leader>r :NvimTreeRefresh<CR>
    bind("n", "<leader>n", ":NvimTreeFindFile<CR>") -- nnoremap <leader>n :NvimTreeFindFile<CR>
    bind("n", "<C-n>", ":NvimTreeToggle<CR>") -- nnoremap <C-n> :NvimTreeToggle<CR>

    nvimtree.nvim_tree_callback({
        veiw = {
            mappings = {
                custom_only = false,
                list = {
                    { key = { "<CL>", "q" }, action = "edit", mode = "n" },
                },
            },
        },
    })
end

-- Debugin System
local ok1, lines = pcall(require, "lsp_lines")
if ok1 then
    bind("", "<Leader>l", lines.toggle, { desc = "Toggle lsp_lines" })
end

-- Buffer manager
bind("n", "<Tab>", ":bn<CR>") -- Buffer Switch
bind("n", "<C-b>", ":bd<CR>") -- Buffer Close

-- Auto comment
bind("v", "<C-/>", ":s/^/#<CR>")

-- Save mode
bind("n", "<C-s>", ":w<CR>")
bind("i", "C-s", ":w<CR>")

-- Nvim Terminal
local ok2, nvim_terminal = pcall(require, "nvim-terminal")
if ok2 then
    terminal = nvim_terminal.DefaultTerminal

    bind("n", "<leader>t", ":lua terminal:toggle()<cr>", silent)
    bind("n", "<leader>1", ":lua terminal:open(1)<cr>", silent)
    bind("n", "<leader>2", ":lua terminal:open(2)<cr>", silent)
    bind("n", "<leader>3", ":lua terminal:open(3)<cr>", silent)
    bind("n", "<leader>1", ':lua NTGlobal["terminal"]:open(1)<cr>', silent)
    bind("n", "<leader>+", ':lua NTGlobal["window"]:change_height(2)<cr>', silent)
    bind("n", "<leader>-", ':lua NTGlobal["window"]:change_height(-2)<cr>', silent)
end

-- cmp autocompelet
local ok3, cmp = pcall(require, "cmp")
if ok3 then
    cmp.setup({

        mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<S-Tab>"] = cmp.mapping.select_prev_item(),
            ["<Tab>"] = cmp.mapping.select_next_item(),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            ["<C-e>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            }),
        },
    })
end

-- barbar tabline manager
-- Move to previous/next
bind("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
bind("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
bind("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
bind("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
bind("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
bind("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
bind("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
bind("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
bind("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
bind("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
bind("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
bind("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
bind("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
bind("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
-- Pin/unpin buffer
bind("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- Close buffer
bind("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
bind("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
-- Sort automatically by...
bind("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
bind("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
bind("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
bind("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

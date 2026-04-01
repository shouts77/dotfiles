  -- Leader key 
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  -- Bootstrap lazy.nvim
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git", "clone", "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  -- Plugins
  require("lazy").setup({
    {
      "nvim-tree/nvim-tree.lua",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("nvim-tree").setup()
      end,
    },
  -- Git 플러그인
  { "lewis6991/gitsigns.nvim", config = true },
  { "tpope/vim-fugitive" },
  { "sindrets/diffview.nvim" },

})

  -- Keymaps
  vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")  -- 파일 트리 토글
  vim.keymap.set("n", "<leader>gg", ":Git<CR>")            -- fugitive 상태창
  vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>")   -- diff 뷰어

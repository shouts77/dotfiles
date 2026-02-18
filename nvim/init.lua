-- Set runtimepath and packpath
vim.opt.runtimepath:prepend(vim.fn.expand("~/.vim"))
vim.opt.runtimepath:append(vim.fn.expand("~/.vim/after"))
vim.opt.packpath = vim.opt.runtimepath:get()

-- Source your old vimrc if needed
vim.cmd("source " .. vim.fn.expand("~/.vimrc"))

-- 시스템 클립보드와 Neovim 레지스터 동기화 설정
vim.opt.clipboard = 'unnamedplus'

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim with all plugins
require("lazy").setup({
  -- LSP and Treesitter
  "nvim-treesitter/nvim-treesitter",
  "neovim/nvim-lspconfig",

  -- nvim-tree plugins
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",
  {
      "nvim-tree/nvim-tree.lua",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
          require("nvim-tree").setup()
      -- nvim-tree 단축키
      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>ef', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
      end,
  },

  -- Core: DB 연결 및 쿼리 실행
  "tpope/vim-dadbod",
  "kristijanhusak/vim-dadbod-ui",
  "kristijanhusak/vim-dadbod-completion",

  -- Copilot plugins
  "github/copilot.vim",
  "nvim-lua/plenary.nvim",
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" }
    },
    config = function()
      require("CopilotChat").setup({

        -- set default model
        model = "gpt-4o",

        -- window configuration
        window = {
            layout = "vertical",
            width = 0.4,
            relative = "editor",
        },

        -- AI의 기본 성격과 지식 범위를 지정 (핵심 설정!)
        system_prompt = [[
          You are an expert AI programming and design assistant.
          The user is a General Manager in a university budgeting division.
          The user is a Korean speaker who studies English.
          When asked in English, please correct the user's English and provide the answer in both English and Korean.
          Ensure both language versions have the same high level of quality and depth.
        ]],
      })
    
      -- Key mappings for CopilotChat
      vim.keymap.set('n', '<leader>cc', '<cmd>CopilotChatOpen<cr>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>ct', '<cmd>CopilotChatToggle<cr>', { noremap = true, silent = true })
  end,
  }
})


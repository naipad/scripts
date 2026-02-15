local lazy_opts = require("plugins.lazy")

local plugins = {
  -- ============================================
  -- UI
  -- ============================================
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      require("plugins.ui.colorscheme").setup()
    end,
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      require("plugins.ui.alpha").setup()
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
      require("plugins.ui.nvim-web-devicons").setup()
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("plugins.ui.nvim-tree").setup()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.ui.lualine").setup()
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.ui.bufferline").setup()
    end,
  },
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    config = function()
      require("plugins.ui.vim-illuminate").setup()
    end,
  },
  {
    "hiphish/rainbow-delimiters.nvim",
    event = "BufReadPost",
    config = function()
      require("plugins.ui.rainbow-delimiters").setup()
    end,
  },
  {
    "brenoprata10/nvim-highlight-colors",
    event = "BufReadPre",
    config = function()
      require("plugins.ui.nvim-highlight-colors").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
    opts = { focus = true },
    cmd = "Trouble",
    keys = {
      { "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open trouble workspace diagnostics" },
      { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Open trouble document diagnostics" },
      { "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Open trouble quickfix list" },
      { "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Open trouble location list" },
      { "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Open todos in trouble" },
    },
  },
  {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function()
      require("plugins.ui.noice").setup()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    config = function()
      require("plugins.ui.indent-blankline").setup()
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    version = "*",
    config = function()
      require("plugins.ui.toggleterm").setup()
    end,
  },

  -- ============================================
  -- Editor
  -- ============================================
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("plugins.editor.nvim-treesitter").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = { "VeryLazy" },
    config = function()
      require("plugins.editor.nvim-treesitter-textobjects").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "VeryLazy" },
    config = function()
      require("plugins.editor.nvim-treesitter-context").setup()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
      "folke/todo-comments.nvim",
    },
    config = function()
      require("plugins.editor.telescope").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.editor.todo-comments").setup()
    end,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("plugins.editor.snacks").setup()
    end,
  },
  {
    "andymass/vim-matchup",
    event = "BufReadPost",
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      require("plugins.editor.which-key").init()
    end,
    config = function()
      require("plugins.editor.which-key").setup()
    end,
  },

  -- ============================================
  -- Coding
  -- ============================================
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.coding.nvim-ts-autotag").setup()
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
      require("plugins.coding.comment").setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "^3.0.0",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "gbprod/substitute.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.coding.substitute").setup()
    end,
  },
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("plugins.coding.blink").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "b0o/SchemaStore.nvim",
    },
    config = function()
      require("plugins.coding.nvim-lspconfig").setup()
    end,
  },
  {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
    config = function()
      require("plugins.coding.mason").setup()
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = { library = { "lazy.nvim", "${3rd}/luv/library" } },
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.coding.conform").setup()
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.coding.nvim-lint").setup()
    end,
  },

  -- ============================================
  -- Git
  -- ============================================
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.git.git-blame").setup()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.git.gitsigns").setup()
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" } },
  },

  -- ============================================
  -- Util (includes DAP, AI, tools)
  -- ============================================
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      "julianolf/nvim-dap-lldb",
    },
    config = function()
      require("plugins.util.nvim-dap").setup()
    end,
  },
  {
    "ojroques/nvim-osc52",
    event = "VeryLazy",
    config = function()
      require("plugins.util.nvim-osc52").setup()
    end,
  },
  {
    "Civitasv/cmake-tools.nvim",
    ft = { "c", "cpp", "h", "hpp", "cmake" },
    config = function()
      require("plugins.util.cmake-tools").setup()
    end,
  },
  {
    "stevearc/overseer.nvim",
    event = "VeryLazy",
    config = function()
      require("overseer").setup()
    end,
  },
  { "preservim/vim-markdown", ft = { "markdown" } },
}

require("lazy").setup(plugins, lazy_opts)

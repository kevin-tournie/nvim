return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommandations de la doc nvim-tree
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          }
        }
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })
    
    local keymap = vim.keymap

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle l'explorateur de fichiers" })
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle l'explorateur de fichiers sur le fichier actif" })
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Ferme l'explorateur de fichiers" }) 
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Rafraichi l'explorateur de fichiers" })
  end
}

vim.g.mapleader = " " -- la touche principale est espace

local keymap = vim.keymap

keymap.set("i", "ùù", "<ESC>", { desc = "Quitte le mode d'insertion avec jk" })
-- Gestion des fenêtres

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Sépare la fenêtre verticalement" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Sépare la fenêtre horizontalement" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalise la taille des onglets" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Ferme la fenêtre active" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Ouvre un nouvel onglet" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Ferme l'onglet actif" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Aller à l'onglet suivant" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Aller à l'onglet précédent" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Ouvre le buffer actuel dans un nouvel onglet" })

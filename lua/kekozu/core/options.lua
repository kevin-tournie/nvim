vim.cmd("let g:netrw_liststyle = 3") -- Permet de changer le style de l'arborescence. Ajoute des "|" et le dépliement.

local opt = vim.opt

opt.relativenumber = false
opt.number = true -- ajoute les nombres sur chaque ligne

-- tabs et indentation
opt.tabstop = 2 -- 2 espaces pour une tab
opt.shiftwidth = 2 -- 2 espaces pour la taille d'indentation
opt.expandtab = true -- convertit les tabs en espaces

opt.wrap = false -- désactive le retour à la ligne automatique lorsque la ligne est trop longue

-- Configuration pour la recherche
opt.ignorecase = true
opt.smartcase = true -- inclue la casse quand la recherche est mixte

opt.cursorline = false

-- Apparence
opt.background = "dark"
opt.signcolumn = "yes"
opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus") -- utilise le presse papier du système

opt.splitright = true -- split vers la droite quand on fait un split vertical
opt.splitbelow = true -- split vers le bas quand on fait un split horizontal

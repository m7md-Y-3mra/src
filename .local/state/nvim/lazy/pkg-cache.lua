return {version=12,pkgs={{name="noice.nvim",source="lazy",spec=function()
return {
  -- nui.nvim can be lazy loaded
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "folke/noice.nvim",
  },
}

end,dir="/home/mohammed/.local/share/nvim/lazy/noice.nvim",file="lazy.lua",},{name="plenary.nvim",source="lazy",spec={"nvim-lua/plenary.nvim",lazy=true,},dir="/home/mohammed/.local/share/nvim/lazy/plenary.nvim",file="community",},{name="telescope.nvim",source="rockspec",spec={"telescope.nvim",specs={{"nvim-lua/plenary.nvim",lazy=true,},},build=false,},dir="/home/mohammed/.local/share/nvim/lazy/telescope.nvim",file="telescope.nvim-scm-1.rockspec",},},}
local cs_status, cs = pcall(require, 'tokyonight')
if not cs_status then
  return
end

--Dont forget to add required config for the theme

cs.setup({
  style = 'moon'
})

vim.cmd [[ colorscheme tokyonight ]]


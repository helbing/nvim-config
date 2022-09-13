local status, lspconfig = pcall(require, 'lspconfig')
if (not status) then return end

lspconfig.on_server_ready(function (server)

end)

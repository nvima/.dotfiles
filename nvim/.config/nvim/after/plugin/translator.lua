local translator = require("translator")
local config = {
    -- default target language
    translator_target_lang = "en",
    -- env var for deepl api key
    translator_deepl_auth = "DEEPL_AUTH",
    -- deepl free api url
    -- translator_deepl_url = "https://api-free.deepl.com/v2/translate",
    -- deepl paid api url
    -- translator_deepl_url = "https://api.deepl.com/v2/translate",
}
translator.setup(config)

vim.keymap.set("v", "<leader>td", function() translator.translate() end)
vim.keymap.set("v", "<leader>tc", function() translator.translate(vim.fn.input('')) end)

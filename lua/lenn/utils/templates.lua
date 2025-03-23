--NOTE: For java: new class create template
vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
  pattern = "*.java",
  callback = function()
    local filename = vim.fn.expand("%:t:r")           -- Nombre del archivo sin extensión
    local filepath = vim.fn.expand("%:h")             -- Ruta completa donde se crea el archivo
    local root = vim.fn.finddir("src", ".;") or "src" -- Encuentra la carpeta `src`

    local package_path = filepath:gsub("^" .. vim.fn.expand("~") .. "/", "") -- Elimina la ruta absoluta HOME
    package_path = package_path:gsub("^.*src/main/java/", "")                -- Elimina todo hasta `src/`
    package_path = package_path:gsub("^main%.java", "")                      -- Elimina `main.java` si está presente en la ruta
    package_path = package_path:gsub("/", ".")                               -- Convierte `/` en `.` para la estructura del paquete

    local package_line = "package " .. package_path .. ";"

    local lines = {
      package_line,
      "",
      "public class " .. filename .. " {",
      "    public static void main(String[] args) {",
      '        System.out.println("Hello, Rex !");',
      "    }",
      "}"
    }

    if vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
      vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    end
  end
})

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })

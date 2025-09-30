local lombok_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls/lombok.jar"
local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls/"
local launcher_jar = vim.fn.glob(jdtls_path .. "plugins/org.eclipse.equinox.launcher_*.jar")
local config_path = jdtls_path .. "config_linux"
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")


local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
local root_dir = require('jdtls.setup').find_root(root_markers)

-- jdtls keymaps
vim.keymap.set('n', "<leader>lo", require("jdtls").organize_imports, { desc = 'Organize imports' })
vim.keymap.set('n', "<leader>lc", require("jdtls").compile, { desc = 'Compile the project' })
vim.keymap.set('n', "<leader>lb", function()
	require("jdtls").build_projects({
		select_mode = "prompt",
		full_build = false
	})
end, { desc = 'Compile the project' })

return {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.level=ALL",
		"-javaagent:" .. lombok_path,
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens", "java.base/java.util=ALL-UNNAMED",
		"--add-opens", "java.base/java.lang=ALL-UNNAMED",
		"-jar", launcher_jar,
		"-configuration", config_path,
		"-data", workspace_dir
	},
	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "JavaSE-1.8",
						path = "/opt/openjdk8/bin/"
					}
				}
			}
		}
	},
	filetypes = { "java" },
	root_markers = root_markers,
	root_dir = root_dir
}

local lsp = require('lsp-zero')
lsp.preset('recommended')
require('mason').setup({})
require('mason-lspconfig').setup({
	-- Replace the language servers listed here 
	-- with the ones you want to install
	ensure_installed = {'gopls', 'clangd', 'lua_ls','tsserver', 'rust_analyzer', 'clojure-lsp'},
	handlers = {
		lsp.default_setup,
	},
})

local clangd_flags = {
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
    "--cross-file-rename",
    "--clang-tidy-checks=-*,readability-identifier-naming,readability-braces-around-statements,bugprone-unused-return-value",
    "--clang-tidy-checks=bugprone-argument-comment,bugprone-dangling-handle,bugprone-parent-virtual-call,bugprone-exception-escape,bugprone-narrowing-conversions,bugprone-incorrect-roundings,bugprone-integer-division,bugprone-signed-char-misuse,bugprone-sizeof-expression,bugprone-suspicious-semicolon",
    "--clang-tidy-checks=modernize-use-trailing-return-type,modernize-use-override,modernize-avoid-c-arrays,modernize-use-using,modernize-deprecated-headers,modernize-replace-auto-ptr,modernize-use-default-member-init",
    "--clang-tidy-checks=performance-*,cppcoreguidelines-*,misc-*",
    "--clang-tidy-checks=google-*,-google-readability-todo,-google-readability-namespace-comments,-google-runtime-references",
    "--clang-tidy-checks=llvm-*,-llvm-include-order",
    "--clang-tidy-checks=boost-*,hicpp-*,-hicpp-signed-bitwise,-hicpp-use-auto,-hicpp-avoid-goto,-hicpp-use-nullptr,-hicpp-vararg,-hicpp-no-array-decay",
    "--suggest-missing-includes",
    "--header-insertion=iwyu",
    "--suggest-missing-includes",
    "--clang-tidy"
}

lsp.setup({
  clangd = {
    flags = clangd_flags
  }
})

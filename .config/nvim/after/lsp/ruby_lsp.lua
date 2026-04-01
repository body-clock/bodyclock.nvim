-- ruby-lsp is installed as a user gem (not via mason) so it respects the
-- project's Ruby version. Run directly — ruby-lsp handles bundler integration
-- internally. Only use `bundle exec ruby-lsp` if ruby-lsp is in the project Gemfile.
-- Install with: gem install ruby-lsp
return {
  cmd = { 'ruby-lsp' },
  filetypes = { 'ruby' },
  root_markers = { 'Gemfile', '.git' },
  init_options = {
    formatter = 'auto',
    linters = { 'rubocop' },
    addonSettings = {
      ['Ruby LSP Rails'] = {
        enablePendingMigrationsPrompt = false,
      },
    },
  },
}

-- ruby-lsp is installed as a gem (not via mason) so it respects the
-- project's Ruby version and bundler environment.
-- Install with: gem install ruby-lsp
--
-- BUNDLE_IGNORE_CONFIG prevents .bundle/config confusion in Vagrant projects.
return {
  cmd = { 'env', 'BUNDLE_IGNORE_CONFIG=1', 'bundle', 'exec', 'ruby-lsp' },
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

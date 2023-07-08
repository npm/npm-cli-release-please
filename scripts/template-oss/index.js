module.exports = {
  lockfile: true,
  windowsCI: false,
  macCI: false,
  allowPaths: [
    '/AUTHORS',
    '/ALLOWED',
  ],
  rootRepo: {
    add: {
      '.github/workflows/new-workflow.yml': './new-workflow.yml',
      '.github/settings.yml': false,
    },
  },
}

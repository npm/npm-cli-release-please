module.exports = {
  lockfile: true,
  windowsCI: false,
  macCI: false,
  allowPaths: [
    '/AUTHORS',
  ],
  rootRepo: {
    add: {
      '.github/workflows/release-integration.yml': 'release-integration.yml',
    },
  },
  workspaceRepo: {
    add: {
      '.github/workflows/release-integration.yml': 'release-integration.yml',
    },
  },
}

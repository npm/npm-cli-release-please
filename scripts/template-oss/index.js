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
      '.github/settings.yml': false,
      '.github/workflows/release.yml': false,
    },
  },
  workspaceRepo: {
    add: {
      '.github/settings.yml': false,
      '.github/workflows/release.yml': false,
    },
  },
}

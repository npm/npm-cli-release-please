module.exports = {
  lockfile: true,
  windowsCI: false,
  macCI: false,
  ciVersions: 'latest',
  allowPaths: [
    '/AUTHORS',
  ],
  backport: 20,
  codeowner: '@lukekarrys',
  rootRepo: {
    add: {
      '.github/settings.yml': false,
      '.github/dependabot.yml': false,
    },
  },
  workspaceRepo: {
    add: {
      '.github/settings.yml': false,
      '.github/dependabot.yml': false,
    },
  },
}

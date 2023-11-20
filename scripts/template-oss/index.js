module.exports = {
  lockfile: true,
  windowsCI: false,
  macCI: false,
  ciVersions: 'latest',
  branches: ['template-oss-mock-testing-branch-do-not-delete'],
  allowPaths: [
    '/AUTHORS',
    '/ALLOWED',
  ],
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

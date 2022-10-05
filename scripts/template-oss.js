module.exports = {
  lockfile: true,
  windowsCI: false,
  macCI: false,
  allowPaths: [
    '/AUTHORS',
  ],
  rootRepo: {
    add: {
      '.github/workflows/post-pull-request.yml': './post-pull-request.yml',
    },
  },
}

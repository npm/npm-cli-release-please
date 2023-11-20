/* This file is automatically added by @npmcli/template-oss. Do not edit. */

'use strict'

const { readdirSync: readdir } = require('fs')

const localConfigs = readdir(__dirname)
  .filter((file) => file.startsWith('.eslintrc.local.'))
  .map((file) => `./${file}`)

module.exports = {
  root: true,
  ignorePatterns: [
    'tap-testdir*/',
    'pkg1/**',
    'pkg2/**',
    'pkg3/**',
    'workspaces/**',
  ],
  extends: [
    '@npmcli',
    ...localConfigs,
  ],
}

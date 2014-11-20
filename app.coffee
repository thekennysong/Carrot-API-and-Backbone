axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'

ClientTemplates = require('client-templates')

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore']

  stylus:
    use: [axis(), rupture(), autoprefixer()]

  extensions: [ClientTemplates( base: "templates/" )]

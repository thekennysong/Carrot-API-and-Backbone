axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
templates    = require 'client-templates'
js_pipeline  = require 'js-pipeline'

module.exports =
  ignores: ['readme.md', '**/layout.*', '**/_*', '.gitignore']

  stylus:
    use: [axis(), rupture(), autoprefixer()]

  extensions: [
    templates(base: 'templates/', pattern: '*.jade', out: 'js/templates.js'),
    js_pipeline(manifest: 'assets/js/manifest.yml', minify: true)
  ]

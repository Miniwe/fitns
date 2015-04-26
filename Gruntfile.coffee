'use strict'
path = require('path')
config =
  'tmpPath': '.tmp'
  'logPath': '.logs'
  'server': 'port': '5000'

module.exports = (grunt) ->
  require('load-grunt-config') grunt,
    configPath: path.join(process.cwd(), 'config/grunt')
    init: true
    data:
      test: false
      curPath: process.cwd()
      tmpPath: path.join(process.cwd(), config.tmpPath)
    loadGruntTasks:
      pattern: 'grunt-*'
      config: require('./package.json')
      scope: 'devDependencies'
    postProcess: (config) ->
    preMerge: (config, data) ->

  require('time-grunt') grunt

  grunt.registerTask 'tmp:create', 'Create tmp folder', ->
    grunt.task.run 'tmp:delete'
    grunt.file.mkdir path.join(process.cwd(), config.tmpPath)
    grunt.file.mkdir path.join(process.cwd(), config.logPath)
    return

  grunt.registerTask 'tmp:delete', 'Delete tmp folder', ->
    grunt.file.delete path.join(process.cwd(), config.tmpPath), force: true
    return
  return

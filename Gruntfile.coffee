'use strict'
path = require('path')
config =
  'tmpPath': '.tmp'
  'logPath': '.logs'
  'server': 'port': '5000'

module.exports = (grunt) ->
  # Load grunt config and tasks automatically
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
  # Time how long tasks take. Can help when optimizing build times

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

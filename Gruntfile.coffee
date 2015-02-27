module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        files:
          'assets/javascript/awm.js': 'assets/coffee/*.coffee'

    watch:
      coffee:
        files: 'assets/coffee/*.coffee'
        tasks: ['coffee:compile']


  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['watch']
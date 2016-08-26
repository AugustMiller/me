$ = require 'cash-dom'

module.exports = ->
  queue = document.body.className.split(' ')

  actions =
    before: require './before'
    after: require './after'
    common: require './common'
    home: require './home'

  actions.before()
  actions.common()

  actions[item]?.call() for item in queue

  actions.after()

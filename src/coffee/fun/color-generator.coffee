_ = require 'underscore'

Map = require 'util/number-map'

module.exports = class ColorGen
  constructor: (options) ->
    @options = _.extend
      hue:
        fn: ->
          Math.random()
        min: 0
        max: 1
      saturation:
        fn: ->
          Math.random()
        min: 0
        max: 1
      lightness:
        fn: ->
          Math.random()
        min: 0
        max: 1
    , options

  hue: ->
    Map @options.hue.fn(), @options.hue.min, @options.hue.max, 0, 360

  saturation: ->
    Map @options.saturation.fn(), @options.saturation.min, @options.saturation.max, 0, 100

  lightness: ->
    Map @options.lightness.fn(), @options.lightness.min, @options.lightness.max, 0, 100

  hsl: ->
    h: @hue()
    s: @saturation()
    l: @lightness()

  is_dark: ->
    @lightness < (@options.lightness.min + @options.lightness.max) / 2

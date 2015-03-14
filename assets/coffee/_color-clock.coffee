window.AWM.Classes.Colorizer = window.AWM.Classes.Colorizer or class Colorizer
  constructor: (el, @sun, options) ->
    @el = $(el)
    @options = $.extend true,
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

    # @classify()
    # @colorize()

    console.log @

  hue: ->
    @options.hue.fn().map @options.hue.min, @options.hue.max, 0, 360

  saturation: ->
    @options.saturation.fn().map @options.saturation.min, @options.saturation.max, 0, 100

  lightness: ->
    @options.lightness.fn().map @options.lightness.min, @options.lightness.max, 0, 100

  classify: ->
    @el.removeClass 'dark'
    @el.addClass 'dark' if @is_dark()

  hsl: ->
    h: @hue()
    s: @saturation()
    l: @lightness()

  parse_template: (template) ->
    template.replace /\{\{([hsl])\}\}/g, (match, part) =>
      console.log "Found a match: #{part}"
      @get_color_part part

  get_color_part: (part) ->
    console.log "Getting #{part}"
    @hsl()[part]

  is_dark: ->
    @lightness < ( @options.lightness.min + @options.lightness.max ) / 2
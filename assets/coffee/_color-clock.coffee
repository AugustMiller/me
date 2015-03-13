window.AWM.Classes.ColorClock = window.AWM.Classes.ColorClock or class ColorClock
  constructor: (el, @sun, options) ->
    @el = $(el)
    @options = $.extend true,
      hue:
        fn: ->
          Math.random() * 360
        min: 0
        max: 360
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

    @classify()
    @colorize()

    console.log @

  hue: ->
    @options.hue.fn().map @options.hue.min, @options.hue.max, 0, 360

  saturation: ->
    @options.saturation.fn().map @options.saturation.min, @options.saturation.max, 0, 1

  lightness: ->
    @options.lightness.fn().map @options.lightness.min, @options.lightness.max, 0, 1

  colorize: ->
    @el.css
      # 'background-color': @as_css_color()
      'color': @as_css_color()

  classify: ->
    @el.removeClass 'dark'
    @el.addClass 'dark' if @is_dark()

  as_css_color: ->
    "hsl(#{@hue()}, #{@saturation() * 100}%, #{@lightness() * 100}%)"

  as_complementary_css_color: ->
    "hsl(#{@hue() + 10}, #{@saturation() * 100}%, #{@lightness() * 100 + 20}%)"

  is_dark: ->
    @lightness < ( @options.lightness.min + @options.lightness.max ) / 2
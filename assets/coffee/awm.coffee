$ ->

  window.AWM.UI.Sun = new window.AWM.Classes.Sol window.AWM.Storage.sunrise, window.AWM.Storage.sunset

  window.AWM.UI.Color = new window.AWM.Classes.Colorizer 'body', window.AWM.UI.Sun,
    hue:
      fn: ->
        time = new Date()
        time.getTime() - time.weekStart()
      min: 0
      max: Date.prototype.WEEK_IN_MILISECONDS
    saturation:
      fn: ->
        1
      min: 0
      max: 1
    lightness:
      fn: ->
        window.AWM.UI.Sun.approximate_brightness()
      min: 0
      max: 1.5

  # Helper functions for monitoring colors

  window.AWM.Storage.update_color = ->
    color = window.AWM.Storage.color_current = window.AWM.UI.Color.hsl()
    # console.log color
    $('body').css
      'color': "hsl(#{color.h}, #{color.s}%, #{color.l.map 0, 100, 20, 100}%)"
      'background-color': "hsl(#{color.h}, #{color.s * 0.75}%, #{color.l.map 0, 100, 80, 100}%)"

  window.AWM.Storage.color_on_load = window.AWM.UI.Color.hsl()

  window.AWM.Storage.update_color()
    
  window.setInterval window.AWM.Storage.update_color, 500

  # This is a lot of fun

  window.AWM.UI.Pen = new window.AWM.Classes.Ink
    color: ->
      color = window.AWM.Storage.color_current
      "hsl(#{(color.h - 40) % 360}, #{color.s}%, #{color.l.map 0, 100, 20, 100}%)"
    canvas_unsupported: window.AWM.Storage.canvas_unsupported
    splatter_threshold: 8
    max_brush_width: 10
    blotchiness: 15


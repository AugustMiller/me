$ ->

  ###
    Hi, I'm glad you're here.
  ###

  ###
    Let's keep track of where we are in the day.
  ###

  window.AWM.UI.Sun = new window.AWM.Classes.Sol window.AWM.Storage.sunrise, window.AWM.Storage.sunset

  ###
    This will help us generate meaningful HSL values from incoming data.
    Psst! See where this is going?
  ###

  window.AWM.UI.Color = new window.AWM.Classes.Colorizer 'body', window.AWM.UI.Sun,
    hue:
      fn: ->
        # time = new Date()
        # time.getTime() - time.weekStart()
        new Date().getTime() % 36000
      min: 0
      # max: 360
      max: 36000
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

  ###
    From time to time, we might update the color palette, like as the sun goes down.
  ###

  window.AWM.Functions.update_color = ->
    color = window.AWM.Storage.color_current = window.AWM.UI.Color.hsl()
    $('body').css
      'color': "hsl(#{color.h}, #{color.s}%, #{color.l}%)"
      # 'background-color': "hsl(#{color.h}, #{color.s * 0.75}%, #{color.l.map 0, 100, 80, 100}%)"

  window.AWM.Storage.color_on_load = window.AWM.UI.Color.hsl()

  window.AWM.Functions.update_color()
    
  window.setInterval window.AWM.Functions.update_color, 500


  ###
    I thought this might be fun to play with.
  ###

  window.AWM.UI.Pen = new window.AWM.Classes.Ink
    color: ->
      color = window.AWM.UI.Color.hsl()
      "hsl(#{(color.h - 40) % 360}, #{color.s}%, #{color.l.map 0, 100, 50, 100}%)"
    canvas_unsupported: window.AWM.Storage.canvas_unsupported
    splatter_threshold: 1
    max_brush_width: 10
    blotchiness: 15


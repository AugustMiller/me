$ ->
  window.AWM.UI.Sun = new window.AWM.Classes.Sol window.AWM.Storage.sunrise, window.AWM.Storage.sunset

  window.AWM.UI.Background = new window.AWM.Classes.ColorClock 'body', window.AWM.UI.Sun,
    hue:
      fn: ->
        time = new Date()
        time.getTime() - time.weekStart()
        # Math.random() * 7
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

  window.AWM.UI.Pen = new window.AWM.Classes.Ink
    color: window.AWM.UI.Background.complementary_as_css_color()
    canvas_unsupported: window.AWM.Storage.canvas_unsupported
    splatter_threshold: 10
    max_brush_width: 10
    blotchiness: 15



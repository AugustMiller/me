$ ->
  window.AWM.UI.Sun = new window.AWM.Classes.Sol window.AWM.Storage.sunrise, window.AWM.Storage.sunset

  window.AWM.UI.Background = new window.AWM.Classes.ColorClock 'body', window.AWM.UI.Sun,
    hue:
      fn: ->
        new Date().getDay()
        # Math.random() * 7
      min: 0
      max: 6
    saturation:
      fn: ->
        1
      min: 0
      max: 1
    lightness:
      fn: ->
        window.AWM.UI.Sun.approximate_brightness()
      min: 0
      max: 1
    ,
    ->
      console.log "haha"

  canvas = 

  window.AWM.UI.Pen = new window.AWM.Classes.Ink
    color: window.AWM.UI.Background.as_complementary_css_color()
    canvas_unsupported: window.AWM.Storage.canvas_unsupported
    splatter_threshold: 5



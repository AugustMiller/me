$ = require 'cash-dom'

DocSize = require 'util/document-size'
Map = require 'util/number-map'
Sol = require 'fun/sol'
Ink = require 'fun/ink'
ColorGen = require 'fun/color-generator'

module.exports = ->
  Generator = new ColorGen
    hue:
      fn: -> new Date().getTime() % 360000
      min: 0
      max: 36000
    saturation:
      fn: -> 1
      min: 0
      max: 1
    lightness:
      fn: -> 0.5
      min: 0
      max: 1

  new Ink
    splatter_threshold: 1.5
    max_brush_width: 10
    blotchiness: 15
    canvas_size: Math.max window.innerWidth, DocSize()
    canvas_frame: $('.canvas-frame')

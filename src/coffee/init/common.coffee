$ = require 'cash-dom'

DocSize = require 'util/document-size'
Map = require 'util/number-map'
Ink = require 'fun/ink'

module.exports = ->
  new Ink
    splatter_threshold: 1.5
    max_brush_width: 10
    blotchiness: 15
    canvas_size: Math.max window.innerWidth, DocSize()
    canvas_frame: $('.canvas-frame')

_ = require 'underscore'
$ = require 'cash-dom'

Map = require 'util/number-map'
RandomWithin = require 'util/number-random-within'
RandomWithinRadius = require 'util/number-random-within-radius'

module.exports = class Ink
  constructor: (options) ->
    @options = _.extend
      color: (ink) -> 'black'
      splatter_threshold: 10
      max_brush_width: 10
      max_splats: 10
      blotchiness: 10
      canvas_size: window.innerWidth * 2
      canvas_frame: $('.canvas-frame')
    , options

    @distance_drawn = 0

    @canvas = $('<canvas />').attr
      width: @options.canvas_size * @scale()
      height: @options.canvas_size * @scale()
    @canvas.appendTo @options.canvas_frame
    @canvas.css 'width', "#{@options.canvas_size}px"

    @context = @canvas[0].getContext('2d')
    @context.lineJoin = 'round'
    @context.lineCap = 'butt'

    @listen()

  listen: ->
    $(document).on 'mousemove', (e) =>
      @track e
      @draw()

  scale: ->
    if window.hasOwnProperty('devicePixelRatio') then window.devicePixelRatio else 1

  delta: (start = @previous(), end = @current) ->
    Math.sqrt(Math.pow((start.y - end.y), 2) + Math.pow((start.x - end.x), 2))

  time_elapsed: ->
    @current.time - @previous().time

  velocity: ->
    @delta(@current, @previous()) / @time_elapsed()

  trajectory: ->
    {
      x: ( @current.x + (@current.x - @previous().x) * 2 )
      y: ( @current.y + (@current.y - @previous().y) * 2 )
    }

  stroke_width: ->
    (@options.max_brush_width / Map Math.sqrt(@velocity()), 0, @options.blotchiness, 1, @options.blotchiness) * @scale()

  previous: ->
    @last_event or
      x: window.innerWidth / 2
      y: window.innerHeight / 2
      time: new Date()

  draw: (e) ->
    @distance_drawn += @delta()
    @context.beginPath()
    @line @previous(), @current, @stroke_width()
    @blot() if @velocity() > @options.splatter_threshold
  
  track: (e) ->
    now =
      x: e.pageX
      y: e.pageY
      time: e.timeStamp

    unless @last_event?
      @last_event = @current = now
    else
      @last_event = @current
      @current = now

    @mileage += @delta @current, @previous()

  colorize: ->
    @context.strokeStyle = @options.color @
    @context.fillStyle = @options.color @

  line: (from, to, width) ->
    @colorize()
    @context.moveTo from.x * @scale(), from.y * @scale()
    @context.lineTo to.x * @scale(), to.y * @scale()
    @context.closePath()
    @context.lineWidth = width
    @context.stroke()

  splatter: (e) ->
    for drop in [0..(Math.random() * @options.max_splats)]
      point = RandomWithinRadius(@current.x, @current.y, @options.max_splats * 2)
      @line @current, point, Math.random() * @options.max_brush_width
      @spot point, Math.sqrt(Math.random() * 100)

  spot: (location, radius) ->
    @colorize()
    @context.beginPath()
    @context.arc location.x * @scale(), location.y * @scale(), radius * @scale(), 0, 2 * Math.PI
    @context.fill()

  clear: ->
    @context.clearRect 0, 0, @canvas.width, canvas.height

  blot: ->
    if Math.random() > 0.5
      location = @trajectory()
      size = Math.pow @velocity(), Math.random()
      @spot location, size

  change_color: (new_color) ->
    @context.strokeStyle = new_color
    @context.fillStyle = new_color

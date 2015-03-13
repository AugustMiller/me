window.AWM.Classes.Ink = window.AWM.Classes.Ink or class Ink
  constructor: (options) ->
    @options = $.extend
      splatter_threshold: 10
    , options

    @canvas = $('<canvas />').attr
      width: window.innerWidth
      height: window.innerHeight
    @context = @canvas[0].getContext('2d')
    @context.strokeStyle = @options.color;
    @context.fillStyle = @options.color;
    @context.lineJoin = "round";
    @context.lineCap = "butt";

    @canvas.appendTo('body')
    @listen()

  listen: ->
    $(window).on 'mousemove', (e) =>
      @cache e
      @draw()

  distance: (start, end) ->
    Math.sqrt(Math.pow((start.y - end.y), 2) + Math.pow((start.x - end.x), 2))

  time_elapsed: ->
    @current.time - @previous().time

  velocity: ->
    @distance(@current, @previous()) / @time_elapsed()

  trajectory: ->
    {
      x: @current.x + (@current.x - @previous().x) * 2
      y: @current.y + (@current.y - @previous().y) * 2
    }

  stroke_width: ->
    10 / Math.sqrt(@velocity()).map 0, 10, 1, 10

  previous: ->
    @last_event or
      x: window.innerWidth / 2
      y: window.innerHeight / 2
      time: new Date()

  draw: (e) ->
    @context.beginPath()
    @context.moveTo @previous().x, @previous().y
    @context.lineTo @current.x, @current.y
    @context.closePath()
    @context.lineWidth = @stroke_width()
    @context.stroke()
    @splatter() if @velocity() > @options.splatter_threshold
  
  cache: (e) ->
    @last_event = @current
    @current =
      x: e.clientX
      y: e.clientY
      time: e.timeStamp

  splatter: ->
    console.log "Could cause splatter", @velocity()
    if Math.random() * 5 > 2.5
      location = @trajectory()
      size = Math.pow @velocity(), Math.random()
      @context.beginPath()
      @context.arc location.x, location.y, size, 0, 2 * Math.PI
      @context.fill()



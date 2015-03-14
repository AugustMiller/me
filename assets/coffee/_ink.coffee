window.AWM.Classes.Ink = window.AWM.Classes.Ink or class Ink
  constructor: (options) ->
    @options = $.extend
      color: ->
        'red'
      splatter_threshold: 10
      max_brush_width: 10
      blotchiness: 10
    , options

    @canvas = $('<canvas />').attr
      width: window.innerWidth
      height: window.AWM.Storage.document_height()
    @canvas.appendTo('body')

    @context = @canvas[0].getContext('2d')
    @context.strokeStyle = @options.color()
    @context.fillStyle = @options.color()
    @context.lineJoin = "round";
    @context.lineCap = "butt";

    @listen()

    console.log @

  listen: ->
    $(document).on 'mousemove', (e) =>
      @track e
      @draw()

  delta: (start, end) ->
    Math.sqrt(Math.pow((start.y - end.y), 2) + Math.pow((start.x - end.x), 2))

  time_elapsed: ->
    @current.time - @previous().time

  velocity: ->
    @delta(@current, @previous()) / @time_elapsed()

  trajectory: ->
    {
      x: @current.x + (@current.x - @previous().x) * 2
      y: @current.y + (@current.y - @previous().y) * 2
    }

  stroke_width: ->
    @options.max_brush_width / Math.sqrt(@velocity()).map 0, @options.blotchiness, 1, @options.blotchiness

  previous: ->
    @last_event or
      x: window.innerWidth / 2
      y: window.innerHeight / 2
      time: new Date()

  draw: (e) ->
    @context.beginPath()
    @line @previous(), @current, @stroke_width()
    @splatter() if @velocity() > @options.splatter_threshold
  
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

  line: (from, to, width) ->
    @context.moveTo from.x, from.y
    @context.lineTo to.x, to.y
    @context.closePath()
    @context.lineWidth = width
    @context.stroke()

  splatter: ->
    if Math.random() > 0.5
      location = @trajectory()
      size = Math.pow @velocity(), Math.random()
      @spot location, size

  spot: (location, radius) ->
    @context.beginPath()
    @context.arc location.x, location.y, radius, 0, 2 * Math.PI
    @context.fill()

  clear: ->
    @context.clearRect 0, 0, @canvas.width, canvas.height


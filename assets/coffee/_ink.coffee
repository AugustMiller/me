window.AWM.Classes.Ink = window.AWM.Classes.Ink or class Ink
  constructor: (options) ->
    @options = $.extend
      color: ->
        'red'
      splatter_threshold: 10
      max_brush_width: 10
      max_splats: 10
      blotchiness: 10
    , options

    @canvas = $('<canvas />').attr
      width: window.innerWidth
      height: window.AWM.Functions.document_height()
    @canvas.appendTo('body')

    @context = @canvas[0].getContext('2d')
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

  colorize: ->
    @context.strokeStyle = @options.color()
    @context.fillStyle = @options.color()

  line: (from, to, width) ->
    @colorize()
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
    @colorize()
    @context.beginPath()
    @context.arc location.x, location.y, radius, 0, 2 * Math.PI
    @context.fill()

  clear: ->
    @context.clearRect 0, 0, @canvas.width, canvas.height

  blot: (e) ->
    for drop in [0..(Math.random() * @options.max_splats)]
      @spot
        x: e.pageX.random_within 50
        y: e.pageY.random_within 50
      , Math.sqrt(Math.random() * 1000) 

  change_color: (new_color) ->
    @context.strokeStyle = new_color
    @context.fillStyle = new_color
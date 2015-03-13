window.AWM.Classes.Sol = window.AWM.Classes.Sol or class Sol
  constructor: (@sunrise, @sunset) ->
    console.log @

  now: ->
    new Date().getTime()

  is_up: ->
    @sunset > @now() > @sunrise

  is_down: ->
    @sunrise > @now()

  to_sunset: ->
    @sunset - @now()

  to_sunrise: ->
    @sunrise - @now()

  to_midnight: ->
    @now()

  day_length: ->
    @sunset - @sunrise

  day_mid: ->
    (@sunset + @sunrise) / 2

  day_progress: ->
    @now() - @day_mid()

  day_progress_as_decimal: ->
    @day_progress().map -@constants.day_half, @constants.day_half, 0, 1

  approximate_brightness: ->
    Math.cos( (2 * Math.PI * @day_progress_as_decimal()) + Math.PI) / 2 + 0.5

  constants:
    day: 1000 * 60 * 60 * 24
    day_half: 1000 * 60 * 60 * 12
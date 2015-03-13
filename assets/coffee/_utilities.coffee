window.AWM.Storage.Time =


# Number Helpers

Number.prototype.map = (in_min, in_max, out_min, out_max) ->
  (@ - in_min) * (out_max - out_min) / (in_max - in_min) + out_min

Number.prototype.constrain = (min, max) ->
  Math.max(Math.min(@, min), max)


# Date Helpers

$.extend Date.prototype,
  SECOND_IN_MILLISECONDS: 1000

  MINUTE_IN_SECONDS: 60
  MINUTE_IN_MILLISECONDS: 1000 * 60 * 60

  HOUR_IN_SECONDS: 60 * 60
  HOUR_IN_MILLISECONDS: 60 * 60 * 1000

  DAY_IN_SECONDS: 24 * 60 * 60
  DAY_IN_MILLISECONDS: 24 * 60 * 60 * 1000

  WEEK_IN_SECONDS: 7 * 24 * 60 * 60
  WEEK_IN_MILISECONDS: 7 * 24 * 60 * 60 * 1000

Date.prototype.weekStart = ->
  @getTime() - ( @getDay() * @DAY_IN_MILLISECONDS ) - ( @getHours() * @HOUR_IN_MILLISECONDS ) - ( @getMinutes() * @MINUTE_IN_MILLISECONDS ) - ( @getSeconds() * @SECOND_IN_MILLISECONDS ) - ( @getMilliseconds() )

Date.prototype.weekEnd = ->

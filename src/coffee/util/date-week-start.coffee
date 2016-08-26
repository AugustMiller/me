DateConstants = require './date-constants'

module.exports = (date) ->
  date.getTime()
    - (date.getDay() * DateConstants.DAY_IN_MILLISECONDS)
    - (date.getHours() * DateConstants.HOUR_IN_MILLISECONDS)
    - (date.getMinutes() * DateConstants.MINUTE_IN_MILLISECONDS)
    - (date.getSeconds() * DateConstants.SECOND_IN_MILLISECONDS)
    - (date.getMilliseconds())

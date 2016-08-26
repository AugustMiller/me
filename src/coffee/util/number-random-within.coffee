Map = require './number-map'

module.exports = (num, distance) ->
  Map Math.random(), 0, 1, (num - distance), (num + distance)

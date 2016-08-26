module.exports = (num, in_min, in_max, out_min, out_max) ->
  (num - in_min) * (out_max - out_min) / (in_max - in_min) + out_min

module.exports = (x, y, r) ->
  angle = Math.random() * 2 * Math.PI
  {
    x: x + Math.random() * r * Math.cos angle
    y: y + Math.random() * r * Math.sin angle
  }

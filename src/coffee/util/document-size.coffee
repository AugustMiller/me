module.exports = ->
  body = document.body
  body_element = document.documentElement
  Math.max body.scrollHeight, body.offsetHeight, body_element.clientHeight, body_element.scrollHeight, body_element.offsetHeight

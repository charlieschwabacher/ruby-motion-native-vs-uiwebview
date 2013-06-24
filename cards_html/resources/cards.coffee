# some basic settings

margin = 30
width = window.innerWidth - 2 * margin
height = window.innerHeight - 2 * margin
animationSpeed = 300


# colors in random order

colors = [
  '#ff695a', '#f9a77c', '#579092', '#3695d8', '#d998a6', 
  '#dc4537', '#fff280', '#94c59c', '#3b5065', '#b75468'
].sort -> 0.5 - Math.random()


# create a view class for cards

class CardView
  constructor: (color) ->
    @el = document.createElement 'div'
    @el.className = 'card'
    @$el = $ @el
    
    @$el.css
      left: margin
      top: margin
      height: height
      width: width
      backgroundColor: color

    @$el.css stackedStyles()


# some functions to generate css transforms, update z indices of cards

stackedStyles = ->
  'opacity': '1.0'
  '-webkit-transform': "rotateY(0rad) rotateZ(0rad) translateX(0px) translateY(0px) translateZ(-100px)"
  '-webkit-perspective': '0'

removedStyles = ->
  direction = Math.random() - 0.5

  rotateY = Math.PI / 4
  rotateZ = direction * Math.PI / 8
  translateX = -window.innerWidth * 1.3
  translateY = -direction * window.innerHeight / 50

  'opacity': '0.5'
  '-webkit-transform': "rotateY(#{rotateY}rad) rotateZ(#{rotateZ}rad) translateX(#{translateX}px) translateY(#{translateY}px) translateZ(0px)"
  '-webkit-perspective': '500'

restack = ->
  view.$el.css('z-index', i, '-webkit-transform': 'none') for view, i in cardViews



# create card views and append to body

cardViews = for color in colors
  cardView = new CardView(color)
  document.body.appendChild cardView.el
  cardView



# handle swipes
# on a left swipe, animate the top card out and move to the bottom
# on a right swipe, move the bottom card to top and animate in

animating = false

$(window).on 'swipeLeft', ->  
  return if animating
  animating = true

  cardView = cardViews.pop()
  cardViews.unshift cardView

  cardView.$el.animate removedStyles(), animationSpeed, 'ease', ->
    animating = false
    cardView.$el.css stackedStyles()
    restack()

$(window).on 'swipeRight', ->
  return if animating
  animating = true

  cardView = cardViews.shift()
  cardViews.push cardView
  
  cardView.$el.css removedStyles()
  restack()

  cardView.$el.animate stackedStyles(), animationSpeed, 'ease', ->
    animating = false

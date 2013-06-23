# some basic settings

margin = 15
columns = 3
tileCount = 100
width = window.innerWidth
tileWidth = (width - (columns + 1) * margin) / columns
tileHeight = tileWidth * 1.5
height = (tileHeight + margin) * Math.ceil(1.0 * tileCount / columns) + margin
colors = ['#ff695a', '#f9a77c', '#579092', '#3695d8', '#d998a6', 
          '#dc4537', '#fff280', '#94c59c', '#3b5065', '#b75468']


# fix height of body

document.body.style.height = height + 'px'


# create tiles

tileViews = for i in [0...tileCount] 
  left = margin + (i % columns) * (tileWidth + margin)
  top = margin + Math.floor(i / columns) * (tileHeight + margin)
  
  tile = document.createElement 'div'
  tile.className = 'tile'

  tile.style.left = left + 'px'
  tile.style.top = top + 'px'
  tile.style.width = tileWidth + 'px'
  tile.style.height = tileHeight + 'px'
  tile.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)]

  document.body.appendChild tile

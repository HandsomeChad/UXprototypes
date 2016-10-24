# Set Device background
Canvas.backgroundColor = "#FFF"
Screen.backgroundColor = "#FFF"

# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "Chad Smith"
	twitter: ""
	description: ""


Framer.Defaults.Animation = 
    curve: "cubic-bezier(0.4, 0.0, 0.2, 1)"
    time: .26

scroll = new ScrollComponent
	width: Screen.width, height: Screen.height
	scrollHorizontal: false

article = new Layer
	width: Screen.width, height: 2397*2
	image: 'images/article.png'
	parent: scroll.content
	
addressBar = new Layer
	width: Screen.width, height: 47*2,
	image: 'images/addressBar.png',
	
variable = 0	
expanded = false	

scroll.on Events.Scroll,->
	#print scroll.scrollY
	if scroll.scrollY > variable && expanded is false
		addressBar.animate
			properties:
				y: -addressBar.height
		mizeContainer.animate
			properties: y: 200
	else if expanded is false
		addressBar.animate
			properties:
				y: 0
		mizeContainer.animate
			properties: y: 200+ 47*2		
				
	variable = scroll.scrollY
	#print variable

	if scroll.scrollY < 400
		#switch to headline
		textSections.animate
			properties: y: 60
	else if scroll.scrollY < 1500
		#switch to article
		textSections.animate
			properties: y: 22
	else if scroll.scrollY < 2500
		#switch to advertising
		textSections.animate
			properties: y: -16
	else if scroll.scrollY < 2900
		#switch to article again
		textSections.animate
			properties: y: 22
	else
		#switch to suggested
		textSections.animate
			properties: y: -54

	

mizeContainer = new Layer
	width: 100*2, height: 100*2
	backgroundColor: '#7494DD'
	borderRadius: 100, x: 510,
	clip: true, y: 200+ 47*2

textSections = new Layer
	image: 'images/textSections.png'
	width: 73*2, height: 72*2
	parent: mizeContainer
	x: mizeContainer.width/2 - (73*2/2)
	y: 60
	#y: -16
	#y: -54
	
maskTop = new Layer
	parent: mizeContainer
	backgroundColor: '#7494DD'
	x: 0, y: 0, width: 200, height: 30*2
	
maskBottom = new Layer
	parent: mizeContainer
	backgroundColor: '#7494DD'
	x: 0, y: 45*2, width: 200, height: 30*2	
	

	
mizeImage = new Layer
	width: 375*2,
	height: 500*2,
	image: 'images/mizeBackground.png'
	parent: mizeContainer
	y: 30, x: -375
	opacity: 0
	
thumbs = new Layer
	width:100*2, height: 43*2
	image: 'images/thumbs.png'
	parent: mizeContainer
	y: 57*2
	
thumbs.states.add
	second: opacity: 0
	first: opacity: 1	
	
mizeImage.states.add
	second: y: 0, x: 0, opacity: 1
	first: y: 30, x: -375, opacity: 0
	
mizeContainer.states.add
	second:
		width: Screen.width
		height: 501*2	
		borderRadius: 0
		x: 0, y: 0
	first:
		width: 100*2
		height: 100*2
		borderRadius: 100
		x: 510, y: 200+ 47*2

mizeLogo = new Layer
	width: 48*2.5, height: 14*2.5
	image: 'images/mizeLogo.png'
	parent: mizeContainer
	y: 27*2, x: 19*2
	opacity: 0
	
minimize = new Layer
	width: 50*2, height: 50*2
	image: 'images/minimize.png'
	parent: mizeContainer
	x: 305*2, y: 15*2

mizeLogo.states.add
	second:
		width: 75*2,
		height: 25*2
		x: 151*2
		y: 53*2
		opacity: 1
	first:
		width: 48*2.5
		height: 14*2.5
		y: 30*2
		x: 19*2
		opacity: 0

# MIZE CONTAINER CLICK HANDLER
mizeContainer.on Events.Click,->
	mizeContainer.stateCycle(["second", "first"])
	mizeLogo.stateCycle(["second", "first"])
	mizeImage.stateCycle(["second", "first"])
	thumbs.stateCycle(["second", "first"])
	
	if expanded is false
		expanded = true
		#print expanded
	else
		expanded = false
		#print expanded

		

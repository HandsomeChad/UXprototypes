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

menu = new Layer
	width: Screen.width, height: Screen.height
	image: 'images/menu.jpg'

backgroundRecents = new Layer
	width: 369*2, height: 103*2, originX: 0, originY: 0
	y: 448*2, clip: true, backgroundColor: '#FFD479'

profilePlate = new Layer
	width: 205*2
	height: 84*2
	image: "images/profilePlate.png",
	parent: backgroundRecents
	x: 542*2, y: 20*2, opacity: 1
	
pointsEarned = new Layer
	width: 323*2, height: 44*2, image: 'images/pointsEarned.png'
	y: 186*2, x: 768*2, parent: backgroundRecents

youRecents= new Layer
	width: 280*2, height: 35*2, image: 'images/yourRecents.png'
	x: 72*2, y: 191*2, parent: backgroundRecents

tabCollection = []

for i in [1..4]
	tab = new Layer
		width: 113*2, height: 110*2, x: 0, y: 0,
		image: 'images/tab' + i + '.png', 
		parent: backgroundRecents, opacity: 1
	tab.x = 0
	
	tabCollection.push tab	


scroll = new PageComponent
	scale: 1, width: 630*2, height: 0, x: 73*2, y: 263*2, backgroundColor: null
	originX: 0, originY: 0, clip: true
scroll.scrollVertical = false


adPage1 = new Layer
	image: 'images/adPageInit.png', width: 630*2, height: 713*2
adPage2 = new Layer
	image: 'images/adPage.png', width: 630*2, height: 713*2
adPage3 = new Layer
	image: 'images/adPage.png', width: 630*2, height: 713*2

scroll.addPage adPage1
scroll.addPage adPage2
scroll.addPage adPage3

adContainer = new Layer
	width: 630*2, height: 175*2, x: 0, y: 448*2, backgroundColor: null
	scale: 0.586, originX: 0, originY: 0, clip: true
	
ad1 = new Layer
	parent: adContainer
	width: 210*2, height: 175*2
	image: 'images/ad1.jpg'
	originX: 0.5, originY: 0
ad2 = new Layer
	parent: adContainer
	width: 210*2, height: 175*2, x: 210*2
	image: 'images/ad2.jpg'
	originX: 0.5, originY: 0
ad3 = new Layer
	parent: adContainer
	width: 210*2, height: 175*2, x: 420*2
	image: 'images/ad3.jpg'
	originX: 0.5, originY: 0

pointsTag1 = new Layer
	parent: ad1
	width: 64*2, height: 62*2, x: 210*2-(64*2)
	image: 'images/pointsTag1.png'
pointsTag2 = new Layer
	parent: ad2
	width: 64*2, height: 62*2, x: 210*2-(64*2)
	image: 'images/pointsTag1.png'
pointsTag3 = new Layer
	parent: ad3
	width: 64*2, height: 62*2, x: 210*2-(64*2)
	image: 'images/pointsTag1.png'	


gallery = new PageComponent
	width: 300*2, height: 550*2
	backgroundColor: null, y: 370*2, clip: false, scale: 0.01, opacity: 0
	#scale: 0.01
gallery.scrollVertical = false
gallery.centerX()

gal1 = new Layer
	width: 300*2, height: 480*2, backgroundColor: null, scale: 0.8
gal1Bottom = new Layer
	parent: gal1
	width: 300*2
	height: 230*2
	y: 120*2
	image:'images/brandPanel.jpg'
gal1Top = new Layer
	parent: gal1
	width: 300*2, height: 250*2
	image: 'images/ad1.jpg'
	y: 120*2
	
gal2 = new Layer
	width: 300*2, height: 480*2, backgroundColor: null
gal2Bottom = new Layer
	parent: gal2
	width: 300*2
	height: 230*2
	y: 120*2
	image:'images/brandPanel.jpg'
gal2Top = new Layer
	parent: gal2
	width: 300*2, height: 250*2
	image: 'images/ad2.jpg'
	y: 120*2

	
gal3 = new Layer
	width: 300*2, height: 480*2, backgroundColor: null, scale: 0.8
gal3Bottom = new Layer
	parent: gal3
	width: 300*2
	height: 230*2
	y: 120*2
	image:'images/brandPanel.jpg'
gal3Top = new Layer
	parent: gal3
	width: 300*2, height: 250*2
	image: 'images/ad3.jpg'
	y: 120*2
	
gal4 = new Layer
	width: 300*2, height: 480*2, backgroundColor: null, scale: 0.8
gal4Bottom = new Layer
	parent: gal4
	width: 300*2
	height: 230*2
	y: 120*2
	image:'images/brandPanel.jpg'
gal4Top = new Layer
	parent: gal4
	width: 300*2, height: 250*2
	image: 'images/ad1.jpg'
	y: 120*2
	
gal5 = new Layer
	width: 300*2, height: 480*2, backgroundColor: null, scale: 0.8
gal5Bottom = new Layer
	parent: gal5
	width: 300*2
	height: 230*2
	y: 120*2
	image:'images/brandPanel.jpg'
gal5Top = new Layer
	parent: gal5
	width: 300*2, height: 250*2
	image: 'images/ad2.jpg'
	y: 120*2
	
gal6 = new Layer
	width: 300*2, height: 480*2, backgroundColor: null, scale: 0.8
gal6Bottom = new Layer
	parent: gal6
	width: 300*2
	height: 230*2
	y: 120*2
	image:'images/brandPanel.jpg'
gal6Top = new Layer
	parent: gal6
	width: 300*2, height: 250*2
	image: 'images/ad3.jpg'
	y: 120*2

gallery.addPage gal1
gallery.addPage gal2
gallery.addPage gal3
gallery.addPage gal4
gallery.addPage gal5
gallery.addPage gal6
gallery.snapToPage(gal2)

gallery.on "change:currentPage", ->
	gallery.currentPage.bringToFront()
	gallery.currentPage.animate
		properties: 
			scale: 1
	gallery.previousPage.animate
		properties: 
			scale: 0.8

backButton = new Layer
	width: 158*2, height: 42*2
	image: 'images/backButton.png'
	y: 360*2, opacity: 0
backButton.centerX()


hotspot = new Layer
	width: 369*2, height: 103*2, y: 448*2, backgroundColor: null
	y: 448*2
	

handlerFunction = ->
	scroll.animate
		properties: opacity: 0.2
	
	gallery.animate
		properties: scale: 1, opacity: 1
	gallery.bringToFront()	
	
	gal1Top.animate
		properties: y: 0
		delay: 0.26
	gal1Bottom.animate
		properties: y: 250*2
		delay: 0.26
		
	gal2Top.animate
		properties: y: 0
		delay: 0.26
	gal2Bottom.animate
		properties: y: 250*2
		delay: 0.26
	
	gal3Top.animate
		properties: y: 0
		delay: 0.26
	gal3Bottom.animate
		properties: y: 250*2
		delay: 0.26
		
	gal4Top.animate
		properties: y: 0
		delay: 0.26
	gal4Bottom.animate
		properties: y: 250*2
		delay: 0.26
		
	gal5Top.animate
		properties: y: 0
		delay: 0.26
	gal5Bottom.animate
		properties: y: 250*2
		delay: 0.26
		
	gal6Top.animate
		properties: y: 0
		delay: 0.26
	gal6Bottom.animate
		properties: y: 250*2
		delay: 0.26
	
	backButton.animate
		properties: opacity: 1, y: 300*2


hotspot.on Events.Click, ->
	adContainer.parent = scroll.content
	adContainer.animate
		properties: scale: 1, height: 713*2, x: 0, y: 0
	scroll.animate
		properties: scale: 1, x: 73*2, y: 263*2, height: 713*2, width: 630*2
		delay: 0.1
	
	ad1.animate
		properties: scale: 0.9
	ad2.animate
		properties: scale: 0.9
	ad3.animate
		properties: scale: 0.9
	
	backgroundRecents.animate
		properties:
			width: 768*2, height: 1024*2
			x: 0, y: 0
			
	for index in [0...4]
		tabCollection[index].animate
			properties: x: index * 110*2, opacity: 1
	
	Utils.delay 0.1,->
		pointsEarned.animate
			properties:
				x: 445*2

profilePlate.on Events.Click,->
	#gallery shrinks back to original size
	#backButton shrinks back to original size
	#adContainer goes back to original position
	adContainer.parent = backgroundRecents
	adContainer.animate
		properties: width: 630*2, height: 175*2, x: 0, y: 0, backgroundColor: null, scale: 0.586, originX: 0, originY: 0, clip: true
	ad1.animate properties: scale: 1
	ad2.animate properties: scale: 1
	ad3.animate properties: scale: 1
		
	backgroundRecents.animate
		properties: width: 369*2, height: 103*2, y: 448*2
	
	scroll.animate
		properties: scale: 1, x: 73*2, y: 263*2, height: 0, width: 630*2
	
	#pointsEarned goes out of frame
	pointsEarned.animate properties: x: 768*2
	#the tabs fold back to original positions
	for index in [0...4]
		tabCollection[index].animate
			properties: x: 0, opacity: 0
				
ad1.on Events.Click,->
	handlerFunction()				
				







backButton.on Events.Click,->
			scroll.animate
				properties: 
					opacity: 1
					
			backButton.animate
				properties:
					opacity: 0
					y: 273*2 
			
			gal1Top.animate
				properties: y: 120*2
				delay: 0.26
			
			gal1Bottom.animate
				properties: y: 120*2
				delay: 0.26
	
			gal2Top.animate
				properties: y: 120*2
				delay: 0.26
			gal2Bottom.animate
				properties: y: 120*2
				delay: 0.26
			
			gal3Top.animate
				properties: y: 120*2
				delay: 0.26
			gal3Bottom.animate
				properties: y: 120*2
				delay: 0.26
				
			gal4Top.animate
				properties: y: 120*2
				delay: 0.26
			gal4Bottom.animate
				properties: y: 120*2
				delay: 0.26
				
			gal5Top.animate
				properties: y: 120*2
				delay: 0.26
			gal5Bottom.animate
				properties: y: 120*2
				delay: 0.26
				
			gal6Top.animate
				properties: y: 120*2
				delay: 0.26
			gal6Bottom.animate
				properties: y: 120*2
				delay: 0.26
				
						
			gallery.animate
				properties: scale: 0.01, opacity: 0
				
				
				
				
				
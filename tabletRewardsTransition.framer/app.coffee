# Set Screen background
Screen.backgroundColor = "#FFFFFF"

# Set Device background
Canvas.backgroundColor = "#FFFFFF"

Framer.Defaults.Animation = 
    curve: "cubic-bezier(0.4, 0.0, 0.2, 1)"
    time: .26



#INTERESTS
squareinterests = new Layer width: 401, x: 368, image: "images/squareInterests.png", clip: true
squareinterests.height = 716
squareinterests.y = -squareinterests.height

searchBar = new Layer
	width: 312, height: 94, parent: squareinterests, image: 'images/searchBar.png',
	x: 45, y: 22, opacity: 0

square1 = new Layer
	width: 201, height: 180, image: 'images/square1.png', parent: squareinterests, y: 178, x: -201, opacity: 0
square2 = new Layer
	width: 201, height: 180, image: 'images/square2.png', parent: squareinterests, y: 178, x: 402, opacity: 0
square3 = new Layer
	width: 201, height: 180, image: 'images/square3.png', parent: squareinterests, y: 357, x: -201, opacity: 0
square4 = new Layer
	width: 201, height: 180, image: 'images/square4.png', parent: squareinterests, y: 357, x: 402, opacity: 0
square5 = new Layer
	width: 201, height: 180, image: 'images/square5.png', parent: squareinterests, y: 536, x: -201, opacity: 0
square6 = new Layer
	width: 201, height: 180, image: 'images/square6.png', parent: squareinterests, y: 536, x: 402, opacity: 0
	
	
	
	
#MERCH
squaremerch = new Layer width: 202, x: 368, y: 0, image: "images/squareMerch.png", clip: true
squaremerch.height = 309
squaremerch.y = -squareinterests.height

merch = new Layer
	width: 202, height: 309, image: 'images/merch.png', parent: squaremerch, opacity: 0, x: 0, y: -40

#CALENDAR
squarecalendar = new Layer width: 368, x: 0, image: "images/squareCalendar.png", clip: true
squarecalendar.height = 462
squarecalendar.y = -squarecalendar.height

calendar = new Layer
	width: 368, height: 461, image: 'images/calendar.png', parent: squarecalendar, opacity: 0, y: -20

squaretime = new Layer width: 368, x: 0, clip: true, backgroundColor: '#FFD479'
squaretime.height = 114
squaretime.y = -squaretime.height

time = new Layer
	width: 368, height: 114, image: 'images/squaretime.png', parent: squaretime,
	opacity: 0, y: -20

#PROFILE
squareprofile = new Layer width: 368, x: 0, y: 0, image: "images/squareProfile.png", clip: true
squareprofile.height = 448
squareprofile.y = -squareprofile.height

profile = new Layer
	width: 368, height: 448, image: 'images/profile.png', parent: squareprofile,
	opacity: 1, y: 0

friends = new Layer
	width: 53, height: 357, image: 'images/friends.png', parent: squareprofile, x: 368, y: 23
	
logo = new Layer
	width: 249, height: 85, image: 'images/logo.png', parent: squareprofile, x: 0, opacity: 0, y: 336

#rewards
squarerewards = new Layer x: 570, y: 0, image: "images/squareRewards.png", width: 199, clip: true
squarerewards.height = 309
squarerewards.y = -squareinterests.height

rewardsLeft = new Layer
	width: 267, height: 220, image: 'images/rewardsLeft.png', parent: squarerewards,
	opacity: 1, y: 0, scale: 0.5, x: 30, originX: 0, y: 115

topRewardTitle = new Layer
	width: 206, height: 13, image: 'images/topRewardTitle.png', x: 262,
	parent: squarerewards, y: 510, opacity: 0

#CIRCLE CHART
#circle settings
radius  = 50
stroke  = 4
viewBox = (radius * 2) + stroke

#container layer
circleBottom = new Layer
	width:  viewBox
	height: viewBox
	backgroundColor: null
	parent: squarerewards
	rotationZ: 147, x: 43, y: 25
	opacity: 0

circle = new Layer
	width:  viewBox
	height: viewBox
	backgroundColor: null
	parent: squarerewards
	rotationZ: 147, x: 43, y: 25

#perimeter formula 2*PI*radius
circleBottom.pathLength = 2 * Math.PI * radius
circle.pathLength = 2 * Math.PI * radius

#svg element
circleBottom.html = """
	<svg viewBox='-#{stroke/2} -#{stroke/2} #{viewBox} #{viewBox}'>
		<circle fill='none' stroke='#FB5D35'
		stroke-width      = '#{stroke}'
		stroke-dasharray  = '#{circle.pathLength}'
		stroke-dashoffset = 100
		cx = '#{radius}'
		cy = '#{radius}'
		r  = '#{radius}'
		stroke-linecap = 'round'
		>
	</svg>"""

circle.html = """
	<svg viewBox='-#{stroke/2} -#{stroke/2} #{viewBox} #{viewBox}'>
		<circle fill='none' stroke='#ffffff'
		stroke-width      = '#{stroke}'
		stroke-dasharray  = '#{circle.pathLength}'
		stroke-dashoffset = '#{circle.pathLength}'
		cx = '#{radius}'
		cy = '#{radius}'
		r  = '#{radius}'
		stroke-linecap = 'round'
		>
	</svg>"""
	


#get a reference after the render  
Utils.domComplete ->
	#circleBottom.path = document.querySelector('svg circle') 
	circle.path = circle.querySelector('svg circle')

#object that we track for modulate animation  
proxy = new Layer
	backgroundColor: null
proxy.on 'change:x', ->
	offset = Utils.modulate(@.x, [0, 100], [circle.pathLength, 150])
	circle.path.setAttribute 'stroke-dashoffset', offset
  
#animate after render	
###
Utils.domComplete ->
	proxy.animate
		properties:
			 x: 100
		delay: 1
		time: 0.8
###  
#COUNTER
counterLayer = new Layer
	backgroundColor: '', width: 245, x: 64, y: 65
	parent: squarerewards
counterLayer.style =
	fontFamily: "Gotham Light, Helvetica, Arial, sans-serif"
	fontSize: "50px"

counterValue = 0

Utils.delay 1, ->
	

#animate after render	
redeemRewards = new Layer
	width: 180, height: 48, image: 'images/redeemButton.png',
	parent: squarerewards, scale: 0.6, originX: 0,
	y: 110, x: 43
 
rewardsRight = new Layer
	width: 291, height: 209, image: 'images/rewardsRight.png', parent: squarerewards,
	x: 400, y: 739, opacity: 0

outtaFifty = new Layer
	width: 108, height: 33, image: 'images/outtaFifty.png',
	x: 315, y: 450, opacity: 0, parent: squarerewards
	
profilePlate = new Layer
	width: 205
	height: 84
	image: "images/profilePlate.png",
	parent: squarerewards
	x: 542, y: 20, opacity: 0

fillBar = new Layer
	backgroundColor: '#E85E34', borderRadius: 100
	width: 379, height: 30, x: 124, y: 186, parent: squarerewards, opacity: 0
	
progressBar = new Layer
	backgroundColor: '#FFFFFF', width: 20, height: 17,
	parent: fillBar, y: 6, x: 7, borderRadius: 100, clip: true
	
H = new Layer
	width: 222, height: 17, backgroundColor: null
	parent: progressBar, x: 60, y: 0, image: 'images/H.png'

adFreeTitle = new Layer
	width: 477, height: 47, image: 'images/adFreeTitle.png',
	x: 137, y: 168, parent: squarerewards, opacity: 0

shoppingIcon = new Layer
	image: 'images/shoppingIcon.png', width: 90, height: 90
	parent: squarerewards, x: 53, y: 12

Utils.delay 1, ->
	squareprofile.animate
		properties: y: 0
		delay: 0
		time: 0.2
	squaretime.animate
		properties: y: 448
		delay: 0	
		time: 0.3
	squarecalendar.animate
		properties: y: 562
		delay: 0
		time: 0.4
	
	squaremerch.animate
		properties: y: 0
		delay: 0
		time: 0.2
	squarerewards.animate
		properties: y: 0
		delay: 0	
		time: 0.2
	squareinterests.animate
		properties: y: 309
		delay: 0
		time: 0.4

		Utils.delay 0.2, ->
			#sections.animate
				#properties: opacity: 1, y: 0
				
			profile.animate
				properties: opacity: 1, y: 0
			friends.animate
				properties: x: 297
			logo.animate
				properties: x: 29, opacity: 1	
			
			time.animate
				properties: opacity: 1, y: 0
				delay: 0.1
			
			calendar.animate
				properties: opacity: 1, y: 0
				delay: 0.2			
			merch.animate
				properties: opacity: 1, y: 0
				delay: 0
			searchBar.animate
				properties: opacity: 1, y: 42
			
			square1.animate
				properties: x: 0, opacity: 1
			square2.animate
				properties: x: 202, opacity: 1
				delay: 0.05
			square3.animate
				properties: x: 0, opacity: 1
				delay: 0.1
			square4.animate
				properties: x: 202, opacity: 1
				delay: 0.15
			square5.animate
				properties: x: 0, opacity: 1
				delay: 0.2
			square6.animate
				properties: x: 202, opacity: 1
				delay: 0.25
				
	
	
tabCollection = []

for i in [1..4]
	tab = new Layer
		width: 113, height: 110, x: 0, y: 0,
		image: 'images/tab' + i + '.png', 
		parent: squarerewards, opacity: 0
	tab.x = 0
	
	tabCollection.push tab

bigHotspot = new Layer width: Screen.width, height: Screen.height, backgroundColor: null	
	
flag = true	

bigHotspot.on Events.Click, ->
	
	if flag == true
		shoppingIcon.animate
			properties: opacity: 0
		
		squarerewards.animate
			properties: width: 768, height: 1024, x: 0
			
		rewardsRight.animate
			properties: opacity: 1, y: 719
			delay: 0.2
		
		rewardsLeft.animate
			properties: opacity: 1, y: 719, scale: 1, x: 86
			delay: 0
			
		for index in [0...4]
			tabCollection[index].animate
				properties: x: index * 111, opacity: 1
				delay: 0.2
		
		redeemRewards.animate
			properties: scale: 1, x: 282, y: 540	
		
		#CIRCLES	
		radius  = 155
		stroke  = 12
		viewBox = (radius * 2) + stroke
		
		#move svg
		circleBottom.animate
			properties: x: 230, y: 280, width: 300, height: 253
	
		circle.animate
			properties: x: 230, y: 280, width: 300, height: 253
		
		counterLayer.animate
			properties:
				y: 370, x: 290
				
		counterLayer.style = fontSize: "120px"
		
		outtaFifty.animate
			properties: opacity: 1, y: 440
		
		profilePlate.animate
			properties: opacity: 1
			delay: 0.1
		
		progressBar.animate
			properties: width: 330
			time: 1
		
		fillBar.animate
			properties: opacity: 1
		
		adFreeTitle.animate
			properties: opacity: 1
			
		proxy.animate
			properties:
				x: 100
			delay: .1
			time: 1.5
	
		circleBottom.animate
			properties: opacity: 1
	
		Utils.interval 0.04, ->
			if counterValue < 32
				counterValue++
				counterLayer.html = counterValue  
		
		topRewardTitle.animate
			properties: y: 500, opacity: 1
			delay: .4
		
		flag = false
	else
		shoppingIcon.animate
			properties: opacity: 1
		
		squarerewards.animate
			properties: width: 199, height: 309, x: 570
			
		rewardsRight.animate
			properties: opacity: 0, y: 729
			delay: 0
		
		rewardsLeft.animate
			properties: opacity: 1, y: 0, scale: 0.5, x: 30, y: 115
			
		for index in [0...4]
			tabCollection[index].animate
				properties: x: -113, opacity: 1
				delay: 0
		
		redeemRewards.animate
			properties: scale: 0.6, y: 110, x: 43
		
		counterLayer.animate
			properties:
				y: 370, x: 290
				
		counterLayer.style = fontSize: "120px"
		
		outtaFifty.animate
			properties: opacity: 0, y: 450
		
		profilePlate.animate
			properties: opacity: 0
			delay: 0
		
		progressBar.animate
			properties: width: 50
			time: 1
		
		fillBar.animate
			properties: opacity: 0
		
		adFreeTitle.animate
			properties: opacity: 0
			
		proxy.animate
			properties:
				x: 0
						
		circleBottom.animate
			properties: opacity: 0
		
		topRewardTitle.animate
			properties: y: 510, opacity: 0
		
		flag = true
		







	


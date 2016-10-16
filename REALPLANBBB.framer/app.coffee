# Disable right-click context menu

#creation de l'input recherche
InputModule = require "input"

if document.addEventListener?
	document.addEventListener "contextmenu", (event) ->
		event.preventDefault()

#region : CLASS button
class _button 
	_createButton: (_x, _y, _height, _width) ->
		_button = new Layer
			x : _x
			y : _y
			height: _height
			width: _width
		return _button
	_setBackGround: (_button, _background) ->
		_button.background = _background
	_setName : (_button, name) -> _button.name = name
	_setBackGroundColor: (_button, _background)->
		_button.backgroundColor = _background

#region : CLASS layout
class _layout
	_createLayout: (_x, _y, _height, _width) ->
		_layout = new Layer
			x : _x
			y : _y
			height: _height
			width: _width
		return _layout
		
	_setName : (_layout, name) ->
		_layout.name = name
	_setBackGroundColor : (_layout, color) ->
		_layout.backgroundColor = color
	_setBackGround: (_layout, background) ->
		_layout.image = background
	_setColor : (_layout, _color) -> _layout.color = _color
		
#region: CLASS input
class _input
	_createInput: (_x, _y, _height, _width) ->
		_input = new InputModule.Input
			x : _x
			y : _y
			height : _height
			width : _width
		return _input
	_setStyle : (_input, _color) -> _input.style.color = _color
	_visibilityInput: (_input, _bool) -> _input.setup = _bool
	_placeholder: (_input, _sentence) -> _input.placeholder = _sentence
	_placeholderColor : (_input, _color) -> _input.placeholderColor = _color
	_goButton: (_input, _bool) -> _input.goButtom = _bool 
	_setName : (_input, name) -> _input.name = name
	
createFirstPage = (_button, _input, _layout, pager) ->
	
	buttonGreen = _button._createButton(300, 650, 150, 150)
	_button._setBackGroundColor(buttonGreen, "transparent")
	buttonGreen.delay = 2
		
	
	layerB = new Layer
		backgroundColor: "rgba(0,0,255,0.3)"
		x: 255
		y : 820
		height: 120
		width: 120
	
	layerB.borderRadius = layerB.width / 2
	
	animationB = new Animation layerB,
		x: 211
		y : 785
		rotation: 360
		height: 200
		width: 200
		options:
			curve: "spring-dho(5, 4, -0.00.1, 0.01)"

	animationB.start()
	animationB.on Events.AnimationEnd, ->
		animationB.restart()
		
	layerA = new Layer
		image: "images/popover.png"
	layerA.visible = false

	animationA = new Animation layerA,
		x: 10
		y : 450
		height: 165
		width: Screen.width - 20
		options:
			curve: "spring-dho(800, 200, 10, 0.01)"
		
	charreButton = _button._createButton(10, 500, 100,(Screen.width - 20))
	charreButton.backgroundColor = "transparent"
	charreButton.on Events.Click, (event, layout) ->
		layerA.destroy()
		layerB.destroy()
		LayerC.destroy()
		pager.snapToPage secondMap
	
	buttonGreen.on Events.Click, (event, layer) ->
	#_button._setBackGroundColor(charreButton, "transparent")
		layerA.visible = true
		
		
		animationA.start()
		
	
	buttonGreen.on Events.DoubleTap, (event, layer) ->
		layerA.destroy()

	LayerC = new Layer
		image: "images/location.png"
		x: 260
		y: 830
		height: 100
		width: 100

			
	researchButton = _button._createButton(10, Align.bottom, 90, 120)
	_button._setBackGround(researchButton, "white")
	_button._setName(researchButton, "researchButton")
	
	printMap = _layout._createLayout(Align.center, 154, 1100, 760)
	_layout._setBackGround(printMap, "images/map1.png")
	_layout._setName(printMap, "printMap")
	
	printTop = _layout._createLayout(Align.center, 25, 130, 790)
	_layout._setBackGround(printTop, "images/begin.png")
	_layout._setName(printTop, "printTop")
	
	searchInput = _input._createInput(80, 75, 50, 690)
	_input._visibilityInput(searchInput, false)
	_input._placeholder(searchInput, "Rechercher une adresse")
	_input._placeholderColor(searchInput, "#333")
	_input._goButton(searchInput, false)
	_input._setStyle(searchInput, "blue")
	_input._setName(searchInput, "searchInput")
	
	layout = _layout._createLayout(Align.center, 2, 20, 750)
	_layout._setBackGround(layout, "images/layout.png")
	_layout._setBackGroundColor(layout, "black")
	_layout._setColor(layout, "black")
	_layout._setName(layout, "layout")
	
	backEnd = _layout._createLayout(Align.center, Align.bottom, 90, 760)
	_layout._setBackGround(backEnd, "images/layout2.png")
	_layout._setName(backEnd, "backEnd")

	pager.addPage printMap
	pager.addChild researchButton
	pager.addChild printTop
	pager.addChild searchInput
	pager.addChild layout
	pager.addChild backEnd
	pager.snapToPage printMap

	secondMap = createSecondPage(_button, _input, _layout, pager)
	pager.addPage secondMap
	
	
	researchButton.on Events.Click, (event, layer) ->
		layerA.destroy()
		layerB.destroy()
		LayerC.destroy()
		pager.snapToPage secondMap
	
createSecondPage = (_button, _input, _layout, pager) ->
	
	
	
	secondMap = _layout._createLayout(Align.center, 154, 1100, 750)
	_layout._setBackGround(secondMap, "images/map-10A.png")
	_layout._setName(secondMap, "secondMap")
	
	return secondMap
	
	
main = () ->
	
	pager = new PageComponent
		width: Screen.width
		height: Screen.height
		scrollVertical: true
		scrollHorizontal: true
	
	_button = new _button
	_input = new _input
	_layout = new _layout
	

			
	
	createFirstPage(_button, _input, _layout, pager)
	
	
main()
	

	
	
	
	
	
	
	
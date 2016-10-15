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
	_setName : (name, _button) ->
		_button.name = name

#region : CLASS layout
class _layout
	_createLayout: (_x, _y, _height, _width) ->
		_layout = new Layer
			x : _x
			y : _y
			height: _height
			width: _width
		return _layout
		
	_setName : (name, _layout) ->
		_layout.name = name
	
	_setBackGround: (background, _layout) ->
		_layout.image = background
		
#region: CLASS input
class _input	
	_createInput: (_x, _y, _height, _width) ->
		_input = new InputModule.Input
			x : _x
			y : _y
			height : _height
			width : _width
		return _input
		
	_visibilityInput: (_input, _bool) -> _input.setup = _bool
	_placeholder: (_input, _sentence) -> _input.placeholder = _sentence
	_placeholderColor : (_input, _color) -> _input.placeholderColor = _color
	_goButton: (_input, _bool) -> _input.goButtom = _bool 
	
createFirstPage = (_button, _input, _layout) ->
	button = _button._createButton(10, Align.bottom, 90, 120)
	_button._setBackGround(button, "white")
	return button
	
main = () ->
	_button = new _button
	_input = new _input
	_layout = new _layout
		
	return createFirstPage(_button, _input, _layout)
	
_button = main()

	
# print la map
printBackground = new Layer
	x: Align.center
	y: Align.center
	width: 760
	height: 1100
	y: 154
	image:"images/map1.png"

#print le background blanc en haut
printSearch = new Layer
	x: Align.center
	y: 25
	width: 790
	height: 130
	image: "images/begin.png"

emailInput = new InputModule.Input
	setup : false
	y: 80
	x: 75
	width: 690
	height: 50
	placeholder: "Rechercher une adresse"
	placeholderColor:"#333"
	goButtom: false

#print la bare d'info tout en haut
printLayout = new Layer
	x: Align.center
	y: 2
	height: 20
	width: 750
	color: "black"
	backgroundColor: "black"
	image:"images/layout.png"

#print la bare bottom
printBack = new Layer
	x: Align.center
	y: Align.bottom
	height: 90
	width: 760
	image:"images/layout2.png"

#change la colour du text qu'on rentre dans l'input recherche
emailInput.style =
	color:"blue"
	
secondMap = new Layer
	x: Align.center
	y: Align.center
	width: 750
	height: 1100
	y: 154
	image: "images/map-10A.png"



pager = new PageComponent
	width: Screen.width
	height: Screen.height
	scrollVertical: false
	scrollHorizontal: false

pager.addPage printBackground
pager.addChild _button
pager.addChild printSearch
pager.addChild emailInput
pager.addChild printLayout
pager.addChild printBack

pager.addPage secondMap

pager.snapToPage printBackground


_button.on Events.Click, (event, layer) ->
	pager.snapToPage secondMap
	

	
	
	
	
	
	
	
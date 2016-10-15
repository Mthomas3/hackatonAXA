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
	

	
	
	
	
	
	
	
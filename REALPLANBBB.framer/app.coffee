# Disable right-click context menu
if document.addEventListener?
	document.addEventListener "contextmenu", (event) ->
		event.preventDefault()
		
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

#creation de l'input recherche
InputModule = require "input"

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

#jsais pas ce que ça fait
emailInput.on Events.Click, ->
	emailInput.focus()
	@print value




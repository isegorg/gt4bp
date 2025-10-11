Class {
	#name : #Gt4BpTicTacToeGame,
	#superclass : #Object,
	#instVars : [
		'cells',
		'bpRunner',
		'messageLabel'
	],
	#category : #'Gt4Bp-TicTacToe-Core'
}

{ #category : #converting }
Gt4BpTicTacToeGame >> asElement [
	| board |
	board := BlElement new
		id: #board;
		layout: (BlGridLayout new columnCount: 3);
		background: Color veryVeryLightGray;
		addChildren: (cells collect: #asElement) flattened;
		constraintsDo: [ :c | 
			c horizontal exact: 300.
			c vertical exact: 300 ];
		yourself.
	messageLabel := BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		text: ('Let''s play!' asRopedText
				fontSize: 25;
				bold;
				foreground: Color darkGray);
		geometry: (BlRoundedRectangleGeometry cornerRadius: 10);
		background: Color lightOrange;
		padding: (BlInsets all: 15);
		margin: (BlInsets top: 20);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent];
		yourself.
	^ BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		addChildren: {board.
				messageLabel};
		yourself
]

{ #category : #accessing }
Gt4BpTicTacToeGame >> cells [
	^ cells
]

{ #category : #'gt-extension' }
Gt4BpTicTacToeGame >> gtLiveFor: aView [
	<gtView>

	^ self asElement gtLiveFor: aView
]

{ #category : #'event - handling' }
Gt4BpTicTacToeGame >> handleBPEvent: event [
	event name = 'moveAccepted'
		ifTrue: [ | eventData player |
			eventData := event data.
			player := eventData at: 'player'.
			self
				updateCellAt: (eventData at: 'row')
				col: (eventData at: 'col')
				player: player	.
			self updateMessage: 'Move ' , player , ' Accepted' ].
	event name = 'gameOver'
		ifTrue: [
		    event data 
		        ifNotNil: [ self updateMessage: 'Game Over: ' , (event data at: 'winner') , ' wins!' ] 
		    	ifNil: [ self updateMessage: 'Game Over: Draw' ]
			 ]
]

{ #category : #'event - dispatching' }
Gt4BpTicTacToeGame >> handleClickAtRow: row col: col [
    | event eventData |
    eventData := Dictionary new
        at: 'player' put: 'X';  "by the moment, always use X"
        at: 'row' put: row;
        at: 'col' put: col;
        yourself.
    event := Gt4BpEvent new
    	name: 'move';
    	data: eventData;
    	yourself.
    bpRunner enqueueEvent: event
]

{ #category : #initialization }
Gt4BpTicTacToeGame >> initialize [
    super initialize.
    self setupBpRunner.
    cells := Array2D new: 3.
    1 to: 3 do: [ :row |
        1 to: 3 do: [ :col |
            cells at: row at: col put: (self newCellAt: row col: col) ] ]
]

{ #category : #'initialization - bp' }
Gt4BpTicTacToeGame >> loadBThread: aBThreadSourceCode named: aFilename [
	bpRunner loadBProgram: aBThreadSourceCode named: aFilename
]

{ #category : #'initialization - cells' }
Gt4BpTicTacToeGame >> newCellAt: aRowIndex col: aColIndex [
	| cell |
    cell := Gt4BpTicTacToeCell new.
    cell onClick: [ :clickEvent | self handleClickAtRow: aRowIndex col: aColIndex ].
    ^ cell
]

{ #category : #'initialization - bp' }
Gt4BpTicTacToeGame >> setupBpRunner [
	bpRunner := Gt4BpRunnerBridge 
	    fromDirectory: (FileLocator temp / 'bt-examples' / 'tictactoe') asFileReference.
	bpRunner onEvent: [ :event | self handleBPEvent: event ]
]

{ #category : #lifecycle }
Gt4BpTicTacToeGame >> start [
	bpRunner start
]

{ #category : #lifecycle }
Gt4BpTicTacToeGame >> stop [
	bpRunner stop
]

{ #category : #'view - updating' }
Gt4BpTicTacToeGame >> updateCellAt: row col: col player: player [
    | cell |
    cell := cells at: row at: col.
    cell playedBy: player
]

{ #category : #'view - updating' }
Gt4BpTicTacToeGame >> updateMessage: aString [
	messageLabel
		ifNotNil: [ messageLabel
				text: (aString asRopedText
						fontSize: 25;
						bold;
						foreground: Color darkGray) ]
]

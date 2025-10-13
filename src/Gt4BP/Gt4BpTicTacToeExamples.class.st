Class {
	#name : #Gt4BpTicTacToeExamples,
	#superclass : #Object,
	#category : #'Gt4Bp-TicTacToe-Examples'
}

{ #category : #example }
Gt4BpTicTacToeExamples >> allRulesGame [
	<gtExample>
    ^ self alterningAndSquareTakenAndWinnerAndGameOverGame
		loadBThread: self btDraw named: 'test-Draw.js';
	    yourself
]

{ #category : #example }
Gt4BpTicTacToeExamples >> alterningAndSquareTakenAndWinnerAndGameOverGame [
	<gtExample>
    ^ self alterningAndSquareTakenAndWinnerGame
		loadBThread: self btGameOver named: 'test-Gameover.js';
	    yourself
]

{ #category : #example }
Gt4BpTicTacToeExamples >> alterningAndSquareTakenAndWinnerGame [
	<gtExample>
	^ self alterningAndSquareTakenGame
	    loadBThread: self btXWin named: 'test-XWin.js';
		loadBThread: self btOWin named: 'test-OWin.js';
		yourself
]

{ #category : #example }
Gt4BpTicTacToeExamples >> alterningAndSquareTakenGame [
	<gtExample>
	| game |
	game := self alterningTurnsGame.
	game loadBThread: self btSquareTaken named: 'test-SquareTaken.js'.
	^ game
]

{ #category : #example }
Gt4BpTicTacToeExamples >> alterningTurnsGame [
	<gtExample>
	| game |
	game := self emptyGame.
	game loadBThread: self btAlterningTurns named: 'test-AlterningTurns.js'.
	^ game
]

{ #category : #'example - support' }
Gt4BpTicTacToeExamples >> btAcceptAnyMove [
	^ 'bp.registerBThread("AcceptAnyMove", function() {
    var anyMoveEvents = bp.EventSet("anyMoveEvents", function (evt) {
        return (evt.data == null) ? false : evt.name == "move";
    });
    while (true) {
        var evt = bp.sync({waitFor: anyMoveEvents});
	    bp.sync({request: bp.Event("moveAccepted", evt.data)});
    }
});'
]

{ #category : #'example - support' }
Gt4BpTicTacToeExamples >> btAlterningTurns [
	^ 'bp.registerBThread("TurnManager", function(){
    var XMoveES = bp.EventSet("move", function(evt) {
	    return (evt.data == null) ? false : (evt.name == "move" && evt.data.player == "X");
    });
    var OMoveES = bp.EventSet("move", function(evt) {
	    return (evt.data == null) ? false : evt.name == "move" && evt.data.player == "O";
    });
    while (true) {
        // X turn
        var xMove = bp.sync({ waitFor: XMoveES, block: OMoveES });
        bp.sync({ request:bp.Event("moveAccepted",
            { "player": "X",
	          "row": xMove.data.row,
	          "col": xMove.data.col })
        });

        // O turn
        var oMove = bp.sync({ waitFor: OMoveES, block: XMoveES });
        bp.sync({ request:bp.Event("moveAccepted",
            { "player": "O",
	          "row": oMove.data.row,
	          "col": oMove.data.col })
        });
    }
});'
]

{ #category : #'example - support' }
Gt4BpTicTacToeExamples >> btDraw [
    <gtExample>
    ^ 'bp.registerBThread("btDraw", function() {
    var moveAcceptedES = bp.EventSet("moveAcceptedES", function(e) {
        return e.name == "moveAccepted";
    });
    for (var i = 1; i <= 9; i++) { 
        bp.sync({ waitFor: moveAcceptedES }); 
    }
    bp.sync({ request: bp.Event("gameOver") }, 9);
});'
]

{ #category : #'example - support' }
Gt4BpTicTacToeExamples >> btGameOver [
    <gtExample>
    ^ 'bp.registerBThread("btGameOver", function() {
    var gameOverES = bp.EventSet("gameOverES", function(e) {
        return e.name == "gameOver";
    });
    bp.sync({ waitFor: gameOverES });
    bp.sync({ block: bp.eventSets.all });
});'
]

{ #category : #'example - support' }
Gt4BpTicTacToeExamples >> btOWin [
	<gtExample>
	^ self btWinForPlayer: 'O'
]

{ #category : #'example - support' }
Gt4BpTicTacToeExamples >> btSquareTaken [
	| squareTakenBlock btSquareTakenCode | 
	squareTakenBlock := [ :row :col | 
		'bp.registerBThread("SquareTaken(' , row , ',' , col , ')", function() {
	    var moveAcceptedToSquareES = bp.EventSet("moveAcceptedToSquare", function(evt) {
	        return (evt.name == "moveAccepted") &&
	            (evt.data.row == ' , row , ') &&
	            (evt.data.col == ' , col , ');
	    });
	    var moveToSquareES = bp.EventSet("moveToSquare", function(evt) {
	        return (evt.name == "move") &&
	            (evt.data.row == ' , row , ') &&
	            (evt.data.col == ' , col , ');
	    });
	    bp.sync({ waitFor: moveAcceptedToSquareES });
	    bp.sync({ block: moveToSquareES });
	});' ].

	btSquareTakenCode := ''.
	
	1 to: 3 do: [ :row | 
		1 to: 3 do: [ :col | 
			btSquareTakenCode := btSquareTakenCode , 
				(squareTakenBlock value: row asString value: col asString) , 
				String crlf,
				String crlf ] ].
			
	^ btSquareTakenCode
]

{ #category : #'example - support' }
Gt4BpTicTacToeExamples >> btWinForPlayer: aString [
	<gtExample>
    | bThreadsWin |
bThreadsWin := self linePermutations collect: [ :aLine | 
	'bp.registerBThread("' , aString , 'Win(', aLine asString ,')", function() {' , 
	String crlf ,
	(aLine flatCollect: [ :aPosition |
	    '    bp.sync({ waitFor: bp.EventSet("', aString , aPosition asString ,'", function(e) {' , String crlf ,
	    '        return e.name == "moveAccepted" && ', String crlf ,
	    '            e.data.player == "', aString , '" && ' , String crlf ,
	    '            e.data.row == ', aPosition x asString , ' && ' , String crlf ,
	    '            e.data.col == ', aPosition y asString , '; ', String crlf ,
	    '         }) }); ' , String crlf
	]) ,
	'    bp.sync({ request: bp.Event("gameOver", { winner: "', aString , '" }) }, 10); ', String crlf ,
'}); ', String crlf , String crlf ].

^ String streamContents: [ :stream |
	bThreadsWin do: [ :bThread | stream nextPutAll: bThread ] ]
]

{ #category : #'example - support' }
Gt4BpTicTacToeExamples >> btXWin [
	<gtExample>
	^ self btWinForPlayer: 'X'
]

{ #category : #example }
Gt4BpTicTacToeExamples >> emptyGame [
	<gtExample>
	| game |
	game := Gt4BpTicTacToeGame new.
	self assert: game cells size equals: 9.
	self
		assert: (game cells allSatisfy: [ :cell | cell isOccupied not ])
		description: 'cells should be not occupied initially'.
	^ game
]

{ #category : #'example - support' }
Gt4BpTicTacToeExamples >> linePermutations [
	| linePermutations |
	linePermutations := OrderedCollection empty.
	self lines do: [ :line |
		line permutationsDo: [:each | linePermutations add: each copy ].
	].
	^ linePermutations
]

{ #category : #'example - support' }
Gt4BpTicTacToeExamples >> lines [
	| horizontals verticals diagonals |
	horizontals := {
	    { 1@1 . 1@2 . 1@3 } .
	    { 2@1 . 2@2 . 2@3 } .
	    { 3@1 . 3@2 . 3@3 } }.
	    
	verticals := {
	    { 1@1 . 2@1 . 3@1 } .
	    { 1@2 . 2@2 . 3@2 } .
	    { 1@3 . 2@3 . 3@3  } }.
	    
	diagonals := {
	    { 1@1 . 2@2 . 3@3 } .
	    { 1@3 . 2@2 . 3@1  } }.
	    
	^ horizontals , verticals , diagonals
]

{ #category : #example }
Gt4BpTicTacToeExamples >> newScripter [
	<gtExample>
	<return: #BlScripter>
	^ BlScripter new
]

{ #category : #example }
Gt4BpTicTacToeExamples >> scripterWithAllRulesGameCheckDraw [
	<gtExample>
	<return: #BlScripter>
	| game aScripter |
	game := self allRulesGame.
	aScripter := self newScripter.
	aScripter
		model: game; 
		element: game asElement.
		
	[ aScripter
		doStep: [ :s | 
			s
				label: 'Starts the game';
				block: [ :model | model start ];
				onModel ].
	aScripter
		clickStep: [ :s | 
			s
				label: 'X(2, 2)';
				// BrButton;
				@ 5 ].
				
	aScripter
		clickStep: [ :s | 
			s
				label: 'O(1, 1)';
				// BrButton;
				@ 1 ].
				
	aScripter
		clickStep: [ :s | 
			s
				label: 'X(1, 2)';
				// BrButton;
				@ 2 ].
				
	aScripter
		clickStep: [ :s | 
			s
				label: 'O(3, 2)';
				// BrButton;
				@ 8 ].
				
	aScripter
		clickStep: [ :s | 
			s
				label: 'X(3, 1)';
				// BrButton;
				@ 7 ].
				
	aScripter
		clickStep: [ :s | 
			s
				label: 'O(1, 3)';
				// BrButton;
				@ 3 ].
				
	aScripter
		clickStep: [ :s | 
			s
				label: 'X(2, 3)';
				// BrButton;
				@ 6 ].
				
	aScripter
		clickStep: [ :s | 
			s
				label: 'O(2, 1)';
				// BrButton;
				@ 4 ].
				
	aScripter
		clickStep: [ :s | 
			s
				label: 'X(3, 3)';
				// BrButton;
				@ 9 ].

	aScripter wait
		label: 'Waits for the state is updated';
		forElementCondition: [ :gameElement | 
				(gameElement children
					select: [ :eachCell | (eachCell label asString = '') not ]) size = 9 ]
			timeout: 2 seconds;
		onSpaceRoot;
		// #board asBlocElementId;
		play.

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check if the message label says draw';
				value: [ :label | label text asString ] equals: [ 'Game Over: Draw' ];
				// BrLabel ].

	] ensure: [ 
		aScripter
			doStep: [ :s | 
				s
					label: 'Stop the game';
					block: [ :model | model stop ];
					onModel ] ].
		
	^ aScripter
]

{ #category : #example }
Gt4BpTicTacToeExamples >> scripterWithAllRulesGameCheckDrawWinnerConflict [
	<gtExample>
	<return: #BlScripter>
	| game aScripter |
	game := self allRulesGame.
	aScripter := self newScripter.
	aScripter
		model: game; 
		element: game asElement.
		
	[ aScripter
		doStep: [ :s | 
			s
				label: 'Starts the game';
				block: [ :model | model start ];
				onModel ].
	aScripter
		clickStep: [ :s | 
			s
				label: 'X(1, 1)';
				// BrButton;
				@ 1 ].
				
	aScripter
		clickStep: [ :s | 
			s
				label: 'O(1, 2)';
				// BrButton;
				@ 2 ].
				
	aScripter
		clickStep: [ :s | 
			s
				label: 'X(2, 2)';
				// BrButton;
				@ 5 ].
				
	aScripter
		clickStep: [ :s | 
			s
				label: 'O(1, 3)';
				// BrButton;
				@ 3 ].
				
	aScripter
		clickStep: [ :s | 
			s
				label: 'X(2, 1)';
				// BrButton;
				@ 4 ].
				
	aScripter
		clickStep: [ :s | 
			s
				label: 'O(2, 3)';
				// BrButton;
				@ 6 ].
				
	aScripter
		clickStep: [ :s | 
			s
				label: 'X(3, 2)';
				// BrButton;
				@ 8 ].
				
	aScripter
		clickStep: [ :s | 
			s
				label: 'O(3, 1)';
				// BrButton;
				@ 7 ].
				
	aScripter
		clickStep: [ :s | 
			s
				label: 'X(3, 3)';
				// BrButton;
				@ 9 ].

	aScripter wait
		label: 'Waits for the state is updated';
		forElementCondition: [ :gameElement | 
				(gameElement children
					select: [ :eachCell | (eachCell label asString = '') not ]) size = 9 ]
			timeout: 5 seconds;
		onSpaceRoot;
		// #board asBlocElementId;
		play.

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check if the message label says X Win';
				value: [ :label | label text asString ] equals: [ 'Game Over: X wins!' ];
				// BrLabel ].

	] ensure: [ 
		aScripter
			doStep: [ :s | 
				s
					label: 'Stop the game';
					block: [ :model | model stop ];
					onModel ] ].
		
	^ aScripter
]

{ #category : #example }
Gt4BpTicTacToeExamples >> scripterWithAlterningTurnsGame [
	<gtExample>
	<return: #BlScripter>
	| game aScripter |
	game := self alterningTurnsGame.
	aScripter := self newScripter.
	aScripter
		model: game; 
		element: game asElement.
		
	[ aScripter
		doStep: [ :s | 
			s
				label: 'Starts the game';
				block: [ :model | model start ];
				onModel ].
	aScripter
		clickStep: [ :s | 
			s
				label: 'Click on the first cell';
				// BrButton;
				@ 1 ].
				
	aScripter
		clickStep: [ :s | 
			s
				label: 'Click on the sixth cell';
				// BrButton;
				@ 6 ].

	aScripter wait
		label: 'Waits for the state is updated';
		forElementCondition: [ :gameElement | 
				(gameElement children
					select: [ :eachCell | (eachCell label asString = '') not ]) size = 2 ]
			timeout: 2 seconds;
		onSpaceRoot;
		// #board asBlocElementId;
		play.

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check that the first cell is labeled with X';
				value: [ :button | button label asString ] equals: [ 'X' ];
				// BrButton;
				@ 1 ].
				
	aScripter
		checkStep: [ :s | 
			s
				label: 'Check that the sixth cell is labeled with O';
				value: [ :button | button label asString ] equals: [ 'O' ];
				// BrButton;
				@ 6 ] 
	] ensure: [ 
		aScripter
			doStep: [ :s | 
				s
					label: 'Stop the game';
					block: [ :model | model stop ];
					onModel ] ].
		
	^ aScripter
]

{ #category : #example }
Gt4BpTicTacToeExamples >> scripterWithGameOverGame [
	<gtExample>
	<return: #BlScripter>
	| aScripter game |
	aScripter := self scripterWithWinnerGame.
	game := aScripter model.
	game loadBThread: self btGameOver named: 'test-Gameover.js'.
	
	[ aScripter
		doStep: [ :s | 
			s
				label: 'Starts the game';
				block: [ :model | model start ];
				onModel ].
	aScripter
		clickStep: [ :s | 
			s
				label: 'O(1, 3)';
				// BrButton;
				@ 3 ].

	aScripter wait
		label: 'Waits for the state is updated';
		forElementCondition: [ :gameElement | 
				(gameElement children
					select: [ :eachCell | (eachCell label asString = '') not ]) size = 5 ]
			timeout: 2 seconds;
		onSpaceRoot;
		// #board asBlocElementId;
		play.

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check (1,3) is not occupied';
				value: [ :button | button label asString ] equals: [ '' ];
				// BrButton; 
				@3 ].

	] ensure: [ 
		aScripter
			doStep: [ :s | 
				s
					label: 'Stop the game';
					block: [ :model | model stop ];
					onModel ] ].
	^ aScripter
]

{ #category : #example }
Gt4BpTicTacToeExamples >> scripterWithSquareTakenGame [
	<gtExample>
	<return: #BlScripter>
	| game aScripter |
	game := self alterningAndSquareTakenGame.
	aScripter := self newScripter.
	aScripter
		model: game; 
		element: game asElement.
		
	[ aScripter
		doStep: [ :s | 
			s
				label: 'Starts the game';
				block: [ :model | model start ];
				onModel ].
	aScripter
		clickStep: [ :s | 
			s
				label: 'Click on the first cell';
				// BrButton;
				@ 1 ].
				
	aScripter
		clickStep: [ :s | 
			s
				label: 'Click again on the first cell';
				// BrButton;
				@ 1 ].

	aScripter wait
		label: 'Waits for the state is updated';
		forElementCondition: [ :gameElement | 
				(gameElement children
					select: [ :eachCell | (eachCell label asString = '') not ]) size = 1 ]
			timeout: 2 seconds;
		onSpaceRoot;
		// #board asBlocElementId;
		play.

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check that the first cell is labeled with X';
				value: [ :button | button label asString ] equals: [ 'X' ];
				// BrButton;
				@ 1 ].
	] ensure: [ 
		aScripter
			doStep: [ :s | 
				s
					label: 'Stop the game';
					block: [ :model | model stop ];
					onModel ] ].
		
	^ aScripter
]

{ #category : #example }
Gt4BpTicTacToeExamples >> scripterWithTrivialLogicGame [
	<gtExample>
	<return: #BlScripter>
	| game aScripter |
	game := self trivialLogicGame.
	aScripter := self newScripter.
	aScripter
		model: game; 
		element: game asElement.
	aScripter		
		checkStep: [ :s | 
			s label: 'Check that all cells are empty';
				satisfies: [ :buttons | buttons allSatisfy: [ :button | button label asString = '' ] ];
				onSpaceRoot;
				// BrButton ].
	^ aScripter
]

{ #category : #example }
Gt4BpTicTacToeExamples >> scripterWithTrivialLogicGameClickCells [
	<gtExample>
	<return: #BlScripter>
	| aScripter |
	aScripter := self scripterWithTrivialLogicGame.
	[ aScripter
		doStep: [ :s | 
			s
				label: 'Starts the game';
				block: [ :game | game start ];
				onModel ].
	aScripter
		clickStep: [ :s | 
			s
				label: 'Click on the first cell';
				// BrButton;
				@ 1 ].
				
	aScripter
		clickStep: [ :s | 
			s
				label: 'Click on the nineth cell';
				// BrButton;
				@ 9 ].

	aScripter wait
		label: 'Waits for the state is updated';
		forElementCondition: [ :gameElement | 
				(gameElement children
					select: [ :eachCell | (eachCell label asString = '') not ]) size = 2 ]
			timeout: 2 seconds;
		onSpaceRoot;
		/ #board asBlocElementId;
		play.

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check that the first cell is labeled with X';
				value: [ :button | button label asString ] equals: [ 'X' ];
				// BrButton;
				@ 1 ].
				
	aScripter
		checkStep: [ :s | 
			s
				label: 'Check that the nineth cell is labeled with X';
				value: [ :button | button label asString ] equals: [ 'X' ];
				// BrButton;
				@ 9 ] 
	] ensure: [ 
		aScripter
			doStep: [ :s | 
				s
					label: 'Stop the game';
					block: [ :game | game stop ];
					onModel ] ].
	^ aScripter
]

{ #category : #example }
Gt4BpTicTacToeExamples >> scripterWithWinnerGame [
	<gtExample>
	<return: #BlScripter>
	| game aScripter |
	game := self alterningAndSquareTakenAndWinnerGame.
	aScripter := self newScripter.
	aScripter
		model: game; 
		element: game asElement.
		
	[ aScripter
		doStep: [ :s | 
			s
				label: 'Starts the game';
				block: [ :model | model start ];
				onModel ].
	aScripter
		clickStep: [ :s | 
			s
				label: 'X(1, 1)';
				// BrButton;
				@ 1 ].
				
	aScripter
		clickStep: [ :s | 
			s
				label: 'O(3, 1)';
				// BrButton;
				@ 7 ].
				
	aScripter
		clickStep: [ :s | 
			s
				label: 'X(2, 2)';
				// BrButton;
				@ 5 ].
				
	aScripter
		clickStep: [ :s | 
			s
				label: 'O(3, 2)';
				// BrButton;
				@ 8 ].
				
	aScripter
		clickStep: [ :s | 
			s
				label: 'X(3, 3)';
				// BrButton;
				@ 9 ].

	aScripter wait
		label: 'Waits for the state is updated';
		forElementCondition: [ :gameElement | 
				(gameElement children
					select: [ :eachCell | (eachCell label asString = '') not ]) size = 5 ]
			timeout: 2 seconds;
		onSpaceRoot;
		// #board asBlocElementId;
		play.

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check if the message label says X wins';
				value: [ :label | label text asString ] equals: [ 'Game Over: X wins!' ];
				// BrLabel ].

	] ensure: [ 
		aScripter
			doStep: [ :s | 
				s
					label: 'Stop the game';
					block: [ :model | model stop ];
					onModel ] ].
		
	^ aScripter
]

{ #category : #example }
Gt4BpTicTacToeExamples >> trivialLogicGame [
	<gtExample>
	| game |
	game := self emptyGame.
	game loadBThread: self btAcceptAnyMove named: 'test-AcceptAnyMove.js'.
	^ game
]

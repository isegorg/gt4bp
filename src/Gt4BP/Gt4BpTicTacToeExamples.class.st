Class {
	#name : #Gt4BpTicTacToeExamples,
	#superclass : #Object,
	#category : #'Gt4Bp-TicTacToe-Examples'
}

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

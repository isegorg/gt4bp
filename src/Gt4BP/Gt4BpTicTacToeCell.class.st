Class {
	#name : #Gt4BpTicTacToeCell,
	#superclass : #Object,
	#instVars : [
		'cellView',
		'clickBlock',
		'playedBy'
	],
	#category : #'Gt4Bp-TicTacToe-Core'
}

{ #category : #'gt-extension' }
Gt4BpTicTacToeCell >> gtLiveFor: aView [
	<gtView>

	^ self asElement gtLiveFor: aView
]

{ #category : #initialization }
Gt4BpTicTacToeCell >> initialize [
    super initialize.
	cellView := self createCellView
]

{ #category : #accessing }
Gt4BpTicTacToeCell >> isOccupied [
	^ false
]

{ #category : #'event - handling' }
Gt4BpTicTacToeCell >> onClick: aBlock [
	cellView action: aBlock
]

{ #category : #accessing }
Gt4BpTicTacToeCell >> playedBy: aPlayerString [
    playedBy := aPlayerString.
    cellView label: aPlayerString
]

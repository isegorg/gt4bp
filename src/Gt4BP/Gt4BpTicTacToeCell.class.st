Class {
	#name : #Gt4BpTicTacToeCell,
	#superclass : #Object,
	#instVars : [
		'cellView',
		'bpRunner',
		'playedBy'
	],
	#category : #'Gt4Bp-TicTacToe-Core'
}

{ #category : #'event - handling' }
Gt4BpTicTacToeCell >> onClick: aBlock [
	cellView action: aBlock
]

{ #category : #accessing }
Gt4BpTicTacToeCell >> playedBy: aPlayerString [
    playedBy := aPlayerString.
    cellView label: aPlayerString
]

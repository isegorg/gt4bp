Class {
	#name : #Gt4BpHomeCard,
	#superclass : #GtHomeCard,
	#instVars : [
		'cardSize'
	],
	#category : #'Gt4Bp-GToolkit-UI'
}

{ #category : #factory }
Gt4BpHomeCard class >> job [
	"I am a card that runs a block as an asynchronous job.
	I store the process id and warning the user if a job is already running."
	^ Gt4BpJobHomeCard new
		definingMethod: (GtPhlowDefiningMethodsCollector forContext: thisContext) collect
]

{ #category : #accessing }
Gt4BpHomeCard >> cardSize [
	^ cardSize ifNil: [ cardSize := 200 @ 150 ]
]

{ #category : #accessing }
Gt4BpHomeCard >> cardSize: anObject [
	cardSize := anObject
]

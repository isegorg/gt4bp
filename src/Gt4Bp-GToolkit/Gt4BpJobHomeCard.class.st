Class {
	#name : #Gt4BpJobHomeCard,
	#superclass : #Gt4BpHomeCard,
	#instVars : [
		'block',
		'mutex',
		'process'
	],
	#category : #'Gt4Bp-GToolkit-UI'
}

{ #category : #accessing }
Gt4BpJobHomeCard >> block [
	^ block
]

{ #category : #accessing }
Gt4BpJobHomeCard >> block: anObject [
	block := anObject
]

{ #category : #running }
Gt4BpJobHomeCard >> defaultAction [
	"Something is wrong here -- a mutex critical: within a mutex critical: makes no sense."

	^ [ :aButton :aModel :anEvent | 
	mutex
		critical: [ process
				ifNil: [ process := [ [ :job | 
						job title: self title.
						self block argumentCount = 0 ifTrue: [ self block value ].
						self block argumentCount = 1 ifTrue: [ self block value: aButton ].
						self block argumentCount = 3
							ifTrue: [ self block
									value: aButton
									value: aModel
									value: anEvent ].
						mutex critical: [ process := nil ] ] asJob run ] fork ]
				ifNotNil: [ self inform: 'A job is already running!' ] ] ]
]

{ #category : #initialization }
Gt4BpJobHomeCard >> initialize [
	super initialize.
	mutex := Mutex new
]

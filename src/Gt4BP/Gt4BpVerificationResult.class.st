Class {
	#name : #Gt4BpVerificationResult,
	#superclass : #Announcement,
	#instVars : [
		'violation',
		'violationDescription',
		'counterExample',
		'timeInMillis',
		'statesScanned',
		'edgesScanned'
	],
	#category : #'Gt4BP-Events'
}

{ #category : #json }
Gt4BpVerificationResult class >> fromDictionary: aDictionary [
    | result |
    result := self new
          violation: (aDictionary at: 'isViolation');
	      timeInMillis: (aDictionary at: 'timeMillis');
	      statesScanned: (aDictionary at: 'statesScanned');
	      edgesScanned: (aDictionary at: 'edgesScanned');
          yourself.
    aDictionary at: 'violation' ifPresent: [ :violationDict |
    	violationDict at: 'description' ifPresent: [ :description | 
    	    result violationDescription: description.
    	].
    	violationDict at: 'counterExampleTrace' ifPresent: [ :events |
    		events do: [ :anEvent | result addCounterExampleEvent: anEvent ]
    	]
    ].
    ^ result

]

{ #category : #json }
Gt4BpVerificationResult class >> fromJson: aString [
	[ | dictionary |
	   dictionary := NeoJSONReader fromString: aString.
	   ^ self fromDictionary: dictionary ]
	on: Exception
	do: [ :ex |
		Transcript crShow: 'Bridge output is invalid JSON: ', aString , '.'.
		ex signal.
	]

]

{ #category : #accessing }
Gt4BpVerificationResult >> addCounterExampleEvent: aBPEvent [
	counterExample ifNil: [ counterExample := OrderedCollection empty].
	counterExample add: aBPEvent

]

{ #category : #accessing }
Gt4BpVerificationResult >> counterExample [
	^ counterExample

]

{ #category : #accessing }
Gt4BpVerificationResult >> edgesScanned [
	^ edgesScanned

]

{ #category : #accessing }
Gt4BpVerificationResult >> edgesScanned: anObject [
	edgesScanned := anObject

]

{ #category : #'as yet unclassified' }
Gt4BpVerificationResult >> fromDictionary: aDictionary [
    | event |
    event := self new
          name: (aDictionary at: 'name');
          type: (aDictionary at: 'type');
          yourself.
    aDictionary at: 'data' ifPresent: [ :dataValue | event data: dataValue ].
    ^ event
]

{ #category : #accessing }
Gt4BpVerificationResult >> isViolation [
	^ violation

]

{ #category : #printing }
Gt4BpVerificationResult >> printString [
	^ self toJson

]

{ #category : #accessing }
Gt4BpVerificationResult >> statesScanned [
	^ statesScanned

]

{ #category : #accessing }
Gt4BpVerificationResult >> statesScanned: anObject [
	statesScanned := anObject

]

{ #category : #accessing }
Gt4BpVerificationResult >> timeInMillis [
	^ timeInMillis

]

{ #category : #accessing }
Gt4BpVerificationResult >> timeInMillis: anObject [
	timeInMillis := anObject

]

{ #category : #json }
Gt4BpVerificationResult >> toJson [
    | dictionary |
	dictionary := {
	    'type' -> 'verificationResult' .
		'isViolation' -> violation .
		'statesScanned' -> statesScanned .
		'edgesScanned' -> edgesScanned .
		'timeMillis' -> timeInMillis } asDictionary.
	violationDescription ifNotNil: [ dictionary at: 'violationDescription' put: violationDescription ].
	counterExample ifNotNil: [ dictionary at: 'counterexample' put: counterExample ].
	^ NeoJSONWriter toString: dictionary

]

{ #category : #accessing }
Gt4BpVerificationResult >> violation: anObject [
	violation := anObject

]

{ #category : #accessing }
Gt4BpVerificationResult >> violationDescription [
	^ violationDescription

]

{ #category : #accessing }
Gt4BpVerificationResult >> violationDescription: aString [
	violationDescription := aString

]

Class {
	#name : #Gt4BpVerifierBridge,
	#superclass : #Gt4BpBridge,
	#category : #'Gt4BP-Core'
}

{ #category : #events }
Gt4BpVerifierBridge >> onVerificationResult: aBlock [
    announcer when: Gt4BpVerificationResult do: [ :event | aBlock value: event ]

]

{ #category : #private }
Gt4BpVerifierBridge >> parseVerificationResult: aString [
	aString lines
		do: [ :eachLine | 
			[ | result |
			result := Gt4BpVerificationResult fromJson: eachLine.
			announcer announce: result ] on: Exception do: [ 'do nothing' ] ]

]

{ #category : #verification }
Gt4BpVerifierBridge >> verify [
	process := GtExternalProcessBuilder new
		command: 'java';
		args: {'-jar'.
				'pharo-local/iceberg/isegorg/gt4bp/BPjsRunnerBridge-0.1.0-SNAPSHOT.jar'.
				btDirectory pathString.
				'--verify'};
		output.
	self parseVerificationResult: process stdout.

]

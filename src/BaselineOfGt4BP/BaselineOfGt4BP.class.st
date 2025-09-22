Class {
	#name : #BaselineOfGt4BP,
	#superclass : #BaselineOf,
	#category : #BaselineOfGt4BP
}

{ #category : #loading }
BaselineOfGt4BP class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'gt4bp' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfGt4BP >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'Gt4BP'
		]
]

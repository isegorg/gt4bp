Class {
	#name : #Gt4BpTitleWithFootersLiveSlide,
	#superclass : #GtTitleWithFootersLiveSlide,
	#instVars : [
		'logosBottomPadding',
		'logos'
	],
	#category : #'Gt4Bp-Talks'
}

{ #category : #'api - instantiation' }
Gt4BpTitleWithFootersLiveSlide >> create [
	| container textContainer contentContainer  logosContainer |
	container := BlElement new
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical matchParent ];
			layout: BlFrameLayout new.

	contentContainer := BlElement new
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical matchParent.
				c frame horizontal weight: 0.6.
				c frame vertical weight: 0.6.
				c frame horizontal alignCenter.
				c frame vertical alignCenter ];
			"border: (BlBorderBuilder new paint: Color red; width: 2; build);"
			layout: BlFrameLayout new.

	textContainer := BlElement new
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical fitContent.
				c frame horizontal weight: 1.
				c frame vertical weight: 0.85.
				c frame vertical alignCenter ];
			layout: BlLinearLayout vertical.
	textContainer
		addChild: (BlTextElement new
				constraintsDo: [ :c | c linear horizontal alignCenter ];
				padding: (BlInsets
						top: 40;
						bottom: self titleBottomPadding);
				text: title).
	subtitle isEmpty
		ifFalse: [ textContainer
				addChild: (BlTextElement new
						constraintsDo: [ :c | c linear horizontal alignCenter ];
						padding: (BlInsets
								top: 40;
								bottom: self subtitleBottomPadding);
						text: subtitle) ].
	footers
		do: [ :aText | 
			textContainer
				addChild: (BlTextElement new
						constraintsDo: [ :c | c linear horizontal alignCenter ];
						padding: (BlInsets
								top: 40;
								bottom: self footerBottomPadding);
						text: aText) ].

	logosContainer := BlElement new
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical matchParent.
				c frame horizontal weight: 1.
				c frame vertical weight: 0.15.
				c frame horizontal alignCenter.
				c frame vertical alignTop ];
			padding: (BlInsets bottom: self logosBottomPadding);
			layout: BlLinearLayout horizontal.

	logos do: [ :aLogoElement | logosContainer addChild: (aLogoElement constraintsDo: [:c | c linear horizontal alignRight ]) ].

	contentContainer addChild: logosContainer.
	contentContainer addChild: textContainer.

	container addChild: contentContainer.

	^ container
]

{ #category : #initialization }
Gt4BpTitleWithFootersLiveSlide >> defaultLogosBottomPadding [
	^ 50
]

{ #category : #initialization }
Gt4BpTitleWithFootersLiveSlide >> initialize [
	super initialize.
	logosBottomPadding := self defaultLogosBottomPadding.
	logos := OrderedCollection empty
]

{ #category : #accessing }
Gt4BpTitleWithFootersLiveSlide >> logosBottomPadding [
	^ logosBottomPadding
]

{ #category : #accessing }
Gt4BpTitleWithFootersLiveSlide >> logosBottomPadding: anObject [
	logosBottomPadding := anObject
]

{ #category : #'as yet unclassified' }
Gt4BpTitleWithFootersLiveSlide >> newLogo: aBlElement [
	logos add: aBlElement
]

{ #category : #'as yet unclassified' }
Gt4BpTitleWithFootersLiveSlide >> newLogoFilename: aString [
	| logoForm logo |
	logoForm := PNGReadWriter
			formFromFileNamed: self picturesDirectoryPath / aString.
	logo := (BlElement new
			size: logoForm extent;
			background: (BlImageBackground new image: logoForm)) asScalableElement.
	self newLogo: logo
]

{ #category : #'as yet unclassified' }
Gt4BpTitleWithFootersLiveSlide >> picturesDirectoryPath [
	<gtExample>
	^ GtResourcesUtilityConstants icebergRepositoriesLocation / 'isegorg' / 'gt4bp' / 'assets' / 'talks' / 'smalltalks2025' / 'images'
]

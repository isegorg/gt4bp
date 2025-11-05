Class {
	#name : #Gt4BpTitledTextAndElementLiveSlide,
	#superclass : #GtTextAndElementLiveSlide,
	#instVars : [
		'subtitle',
		'subtitleBottomPadding'
	],
	#category : #'Gt4Bp-Talks'
}

{ #category : #'as yet unclassified' }
Gt4BpTitledTextAndElementLiveSlide >> create [
	| container textAndElementContainer textContainer completeText contentContainer |
	container := BlElement new
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical matchParent ];
			layout: BlFrameLayout new.

	contentContainer := BlElement new
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical matchParent.
				c frame horizontal weight: 0.7.
				c frame vertical weight: 0.7.
				c frame horizontal alignCenter.
				c frame vertical alignCenter ];
			layout: BlLinearLayout vertical.

	textAndElementContainer := BlElement new
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical matchParent ];
			padding: (BlInsets top: 20 bottom: 20);
			layout: BlFrameLayout new.

	textContainer := BlElement new
			constraintsDo: [ :c | 
				c frame horizontal weight: 1 - elementWeight.
				c vertical matchParent.
				c horizontal matchParent ];
			padding: (BlInsets
					top: 10
					left: 50
					bottom: 10
					right: 50);
			layout: BlLinearLayout vertical alignCenter.

	completeText := texts allButFirst
			inject: (texts first asRopedText
					attributes: {BrTextParagraphMarginAttribute
								paragraphMargin: (BlInsets
										top: 10
										left: 0
										bottom: 0
										right: 0)})
			into: [ :all :each | 
				all , String cr asRopedText
					, (each
							attributes: {BrTextParagraphMarginAttribute
										paragraphMargin: (BlInsets
												top: 10
												left: 0
												bottom: 0
												right: 0)}) ].
	textContainer
		addChild: ((BrEditor new
				aptitude: (BrGlamorousEditorAptitude new lineSpacing: 5);
				hMatchParent;
				vFitContent;
				text: completeText) beReadOnlyWithSelection asScalableElement maxScale: 1).

	textAndElementContainer
		addChild: textContainer;
		addChild: (elementStencil value asElement
				constraintsDo: [ :c | 
					c frame horizontal weight: elementWeight.
					c frame horizontal alignRight.
					c vertical matchParent.
					c horizontal matchParent ]).
	textAndElementContainer explainer isExplanationHolder: true.

	contentContainer
		addChild: (BlTextElement new
				constraintsDo: [ :c | c linear horizontal alignCenter ];
				text: subtitle);
		addChild: (textAndElementContainer constraintsDo: [ :c | c linear horizontal alignCenter ]).

	container addChild: contentContainer.

	^ container
]

{ #category : #initialization }
Gt4BpTitledTextAndElementLiveSlide >> defaultSubtitleBottomPadding [
	^ 40
]

{ #category : #initialization }
Gt4BpTitledTextAndElementLiveSlide >> initialize [
	super initialize.
	subtitleBottomPadding := self defaultSubtitleBottomPadding
]

{ #category : #accessing }
Gt4BpTitledTextAndElementLiveSlide >> subtitle: aString [
	self subtitleWithFormat: (aString asRopedText fontSize: 20; glamorousRegularFont).
]

{ #category : #accessing }
Gt4BpTitledTextAndElementLiveSlide >> subtitleBottomPadding [
	^ subtitleBottomPadding
]

{ #category : #accessing }
Gt4BpTitledTextAndElementLiveSlide >> subtitleBottomPadding: anObject [
	subtitleBottomPadding := anObject
]

{ #category : #accessing }
Gt4BpTitledTextAndElementLiveSlide >> subtitleWithFormat: aText [
	subtitle := aText
]

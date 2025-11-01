Class {
	#name : #Gt4BpParagraphLiveSlide,
	#superclass : #GtParagraphLiveSlide,
	#category : #'Gt4Bp-Talks'
}

{ #category : #'as yet unclassified' }
Gt4BpParagraphLiveSlide >> create [
	| container contentContainer |
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
			layout: BlLinearLayout vertical.

	contentContainer
		addChild: (BrEditorElement new
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent.
					c linear horizontal alignCenter ];
				padding: (BlInsets all: 10);
				editor: (BrTextEditorModel new text: self fullText)).

	container addChild: contentContainer.
	^ container
]

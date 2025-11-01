Extension { #name : #GtProtoLiveSlide }

{ #category : #'*Gt4Bp-Talks' }
GtProtoLiveSlide >> paragraph [
	^ Gt4BpParagraphLiveSlide new
		definingMethod: (GtPhlowDefiningMethodsCollector forContext: thisContext) collect
]

{ #category : #'*Gt4Bp-Talks' }
GtProtoLiveSlide >> titleWithLogosAndFooters [
	^ Gt4BpTitleWithFootersLiveSlide new
		definingMethod: (GtPhlowDefiningMethodsCollector forContext: thisContext) collect
]

{ #category : #'*Gt4Bp-Talks' }
GtProtoLiveSlide >> titledTextAndElement [
	^ Gt4BpTitledTextAndElementLiveSlide new
		definingMethod: (GtPhlowDefiningMethodsCollector forContext: thisContext) collect
]

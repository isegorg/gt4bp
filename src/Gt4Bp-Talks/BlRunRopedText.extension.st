Extension { #name : #BlRunRopedText }

{ #category : #'*Gt4Bp-Talks' }
BlRunRopedText >> asLinkTo: aUrl [
	^ self
		foreground: Color blue;
		onClick: [  "aTarget phlow spawnObject: (GtWebViewElement new url: aUrl asString) ":aTextualPiece :aTarget :aTextEditor :anEvent | WebBrowser openOn: aUrl asString ];
		attribute: (BrTextHoverStylableAttribute new
				attribute: (BlTextDecorationAttribute new underline color: Color blue));
		yourself
]

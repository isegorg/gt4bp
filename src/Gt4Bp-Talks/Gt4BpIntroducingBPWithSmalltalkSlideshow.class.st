Class {
	#name : #Gt4BpIntroducingBPWithSmalltalkSlideshow,
	#superclass : #PrioritySlideshow,
	#category : #'Gt4Bp-Talks'
}

{ #category : #accessing }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slidePriorities [
	<gtExample>
	<return: #Array>
	^ #(titleSlideFor:)
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> title: aSlide [
	<gtSlide>
	<text: 'Welcome to this talk about a different way of thinking about software --one that is closer to how we naturally understand and describe behavior, rather than how we usually code it.
	
The subtitle "The Quest for Executable Knowledge" reflects what I personally believe programming is really about: turning our understanding of a system into executable models.

So, let''s begin with the obvious question: What''s Behavioral Programming?'>
	^ aSlide titleWithFooters
		setPriority;
		titleBottomPadding: 20;
		subtitleBottomPadding: 40;
		titleWithFormat: (self asTitle: 'Introducing Behavioral Programming with Smalltalk');
		subtitleWithFormat: (self asSubtitle: 'The Quest of Executable Knowledge');
		newFooterWithFormat: (self asBigText: 'Smalltalks 2025');
		newFooterWithFormat: (self asBigText: '@rafael_luque')
]

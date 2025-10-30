Class {
	#name : #Gt4BpIntroducingBPWithSmalltalkSlideshow,
	#superclass : #PrioritySlideshow,
	#category : #'Gt4Bp-Talks'
}

{ #category : #'as yet unclassified' }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide1_1: aSlide [
	<gtSlide>
	<text: '# 1.1. What''s Behavioral Programming?

Behavioral Programming is a new paradigm focused on building systems by composing behaviors incrementally
--in a way closer to how we think about scenarios, rather than how we normally structure control flow.'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: '1. What''s Behavioral Programming?');
		paragraphWithFormat: (self asText: '
		
'), (self asText: 'A paradigm for developing software through natural, incremental specification of behavior.') italic,
(self asText: '


'), (self asText: 'Systems are defined by behaviors instead of algorithms.')
]

{ #category : #'as yet unclassified' }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide1_2: aSlide [
	<gtSlide>
	<text: '# 1.2. Scientific Work and Evolution

BP is not a single tool. It''s a researh line spanning over 25 years.

BP builds on decades of research by David Harel and others.

It started with a first paper about Live Sequence Charts by Werner Damm and David Harel on 1999.

Then the book "Come, Let''s Play" by David Harel and Rami Marelli on 2003.

Then Scenario-Based Programming evolved into Behavioral Programming that was introduced in an article on 2010.

The BPjs tools were developed on 2017.'>
	^ aSlide textAndElement
		setPriority;
		elementWeight: 0.5;
		newTextWithFormat: (self asText: 'BP builds on a research line by David Harel and others spanning '), 
			(self asText: 'over 25 years.') bold;
		newTextWithFormat: (self asText: 'It started with '), 
			(self asText: 'Scenario-Based Programming and LSCs, ') bold, (self asBigText: 'and evolved to BP.');
		element: [ self timelineElement margin: (BlInsets top: 350 bottom: 350 left: 50 right: 50) ]
]

{ #category : #accessing }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slidePriorities [
	<gtExample>
	<return: #Array>
	^ #(titleSlideFor: slide1_!: slide1_2:)
]

{ #category : #'slide - element' }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> timelineElement [
	<gtExample>
	<return: #BlElement>
	| plotter |
	plotter := GtPlotter new.
	plotter verticalTimeline
		withProjectionAxis;
		timelineData: #key;
		projectionData: #value;
		timelineFrom: 1998 asYear to: 2018 asYear;
		with: {1999 asYear -> 'Live Sequence Charts (Damm & Harel)'.
				2003 asYear -> 'Come, Let''s Play (Harel & Marelli)'.
				2010 asYear -> 'Behavioral Programming (Harel, Marron, Weiss)'.
				2017 asYear -> 'BPjs Tool (Weiss, Bar-Sinai)'}.
	^ plotter asElement
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
		subtitleBottomPadding: 160;
		titleWithFormat: (self asTitle: 'Introducing Behavioral Programming with Smalltalk');
		subtitleWithFormat: (self asSubtitle: 'The Quest of Executable Knowledge') italic;
		newFooterWithFormat: ((self asBigText: 'Smalltalks 2025') bold; foreground: Color purple);
		newFooterWithFormat: (self asBigText: '@rafael_luque')
]

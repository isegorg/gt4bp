Class {
	#name : #Gt4BpIntroducingBPWithSmalltalkSlideshow,
	#superclass : #PrioritySlideshow,
	#category : #'Gt4Bp-Talks'
}

{ #category : #open }
Gt4BpIntroducingBPWithSmalltalkSlideshow class >> show [
	^ super show
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> argentineBlue [
	^ Color
		r: 102 / 255
		g: 186 / 255
		b: 233 / 255
]

{ #category : #'as yet unclassified' }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> picturesDirectoryPath [
	^ GtResourcesUtilityConstants icebergRepositoriesLocation / 'isegorg' / 'gt4bp' / 'assets' / 'talks' / 'smalltalks2025' / 'images'
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide1_1: aSlide [
	<gtSlide>
	<text: '# 1.1 What''s Behavioral Programming?

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

{ #category : #slides }
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

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide2: aSlide [
	<gtSlide>
	<text: '# 2. Motivations: Why another paradigm?'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: '2. Motivations: Why another paradigm?')
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide2_1: aSlide [
	<gtSlide>
	<text: '# 2.1 The Climb Up of the Abstraction Ladder
	
We''ve made an incredible progress in programming languages
--each step giving us more abstraction and expressive power.'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'The Abstraction Ladder');
		paragraphWithFormat: (self asText: '
There has been an amazing transition up the language abstraction ladder.

From machine languages,
to assembly,
to high-level languages,
and then to a wide variety of paradigms:
functional, logical, concurrent, constraint-based,
visual, object-oriented, aspect-oriented, and more.')
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide2_2: aSlide [
	<gtSlide>
	<text: '# 2.2 And Yet... 
	
Even if you work in one of the most beautiful environments ever created --obviously Smalltalk-- 
the essence of programming still feels too hard.'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'And Yet...');
		paragraphWithFormat: (self asText: '
Even if you are lucky enough to be working in the wonderful Smalltalk environment...

programming still feels the same kind of '), (self asText: 'technically tedious work') bold, (self asText:' --just at a higher level of abstraction.')
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide2_3: aSlide [
	<gtSlide>
	<text: '# 2.3 The Elephant in the Room of Software
	
'>
	^ aSlide titledTextAndElement
		setPriority;
		elementWeight: 0.5;
		subtitleWithFormat: (self asSubtitle: 'The Elephant in the Room of Software');
		newTextWithFormat: (self
				asText: 'There is something fundamentally wrong with the way we build software.');
		element: [ GtFilePictureLiveSlide new
				fileReference: (self picturesDirectoryPath / 'elephant-in-room.png') ]
]

{ #category : #accessing }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slidePriorities [
	<gtExample>
	<return: #Array>
	^ #(#title: 
	    #slide1_1: #slide1_2:
	    #slide2: #slide2_1: #slide2_2 #slide2_3:)
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
	"^ aSlide titleWithFooters"

	<gtSlide>
	<text: 'Welcome to this talk about a different way of thinking about software --one that is closer to how we naturally understand and describe behavior, rather than how we usually code it.
	
The subtitle "The Quest for Executable Knowledge" reflects what I personally believe programming is really about: turning our understanding of a system into executable models.

So, let''s begin with the obvious question: What''s Behavioral Programming?'>
	^ aSlide titleWithLogosAndFooters
		setPriority;
		titleBottomPadding: 20;
		subtitleBottomPadding: 160;
		logosBottomPadding: 0;
		titleWithFormat: (self asTitle: 'Introducing Behavioral Programming with Smalltalk');
		subtitleWithFormat: (self asSubtitle: 'The Quest of Executable Knowledge') italic;
		newFooterWithFormat: ((self asBigText: 'Smalltalks 2025')
				bold;
				foreground: self argentineBlue);
		newFooterWithFormat: (self asBigText: '@rafael_luque');
		newLogoFilename: 'smalltalks2025-logo.png';
		newLogoFilename: 'osoco-logo.png'
]

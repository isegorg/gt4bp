Class {
	#name : #Gt4BpIntroducingBPWithSmalltalkSlideshow,
	#superclass : #PrioritySlideshow,
	#category : #'Gt4Bp-Talks'
}

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> argentineBlue [
	^ Color
		r: 102 / 255
		g: 186 / 255
		b: 233 / 255
]

{ #category : #'as yet unclassified' }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> picturesDirectoryPath [
	<gtExample>
	^ GtResourcesUtilityConstants icebergRepositoriesLocation / 'isegorg' / 'gt4bp' / 'assets' / 'talks' / 'smalltalks2025' / 'images'
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide0: aSlide [
	"^ aSlide titleWithFooters"

	<gtSlide>
	<text: 'Welcome to this talk about a different way of thinking about software 
	--one that is closer to how we naturally understand and describe behavior, rather than how we usually code it.
	
The subtitle "The Quest for Executable Knowledge" reflects what I personally believe programming is really about: 
turning our understanding of a system into executable models.

So, let''s begin with the obvious question: What''s Behavioral Programming?'>
	^ aSlide titleWithLogosAndFooters
		setPriority;
		titleBottomPadding: 20;
		subtitleBottomPadding: 160;
		logosBottomPadding: 0;
		footerBottomPadding: 40;
		titleWithFormat: (self asTitle: 'Introducing Behavioral Programming with Smalltalk');
		subtitleWithFormat: (self asSubtitle: 'The Quest of Executable Knowledge') italic;
		newFooterWithFormat: ((self asSubtitle: 'Smalltalks 2025')
				bold;
				foreground: self argentineBlue);
		newFooterWithFormat: (self asBigText: 'Rafael Luque · OSOCO');
		newLogoFilename: 'smalltalks2025-logo.png';
		newLogoFilename: 'osoco-logo.png'
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide1_1: aSlide [
	<gtSlide>
	<text: '# 1.1 What''s Behavioral Programming?

Behavioral Programming is a new paradigm focused on building systems by composing behaviors incrementally
--in a way that is closer to how we think about scenarios, rather than how we normally structure control flow.'>
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
	^ aSlide titledTextAndElement
		setPriority;
		elementWeight: 0.5;
		subtitleWithFormat: (self asSubtitle: 'Scientific Work and Evolution');
		newTextWithFormat: (self asText: 'BP builds on a research line by '), (self asText: 'David Harel') bold, (self asText: ' and others spanning '), 
			(self asText: 'over 25 years.') bold;
		newTextWithFormat: (self asText: 'It started with '), 
			(self asText: 'Scenario-Based Programming and LSCs, ') bold, (self asBigText: 'and after it evolved to BP.');
		element: [ self timelineElement ]
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide2: aSlide [
	<gtSlide>
	<text: '# 2. Motivations 
	
	Let''s talk a bit about the motivations of BP. Why we need another paradigm?'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: '2. Why we need another paradigm?')
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

From'), (self asText: ' machine languages') bold, (self asText:'
to '), (self asText: 'assembly') bold, (self asText: '
to '), (self asText: 'high-level languages.') bold, (self asText: '

And then to a wide variety of '), (self asText: 'paradigms') bold, (self asText: ':
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
	
There is an elephant in the room.

Something is fundamentally wrong with how we build software.

Probably some of you feel the same than me, even if we don''t know exactly what is the problem or how to articulate it.

Programming is too hard --not because computers themselves, but because out tools force us into very unnatural ways of thinking.
'>
	^ aSlide titledTextAndElement
		setPriority;
		elementWeight: 0.5;
		subtitleWithFormat: (self asSubtitle: 'The Elephant in the Room of Software');
		newTextWithFormat: (self
				asText: 'There is something fundamentally wrong with the way we build software.');
		newTextWithFormat: (self asText: 'Our tools force us into unnatural ways of thinking.');
		element: [ GtFilePictureLiveSlide new
				fileReference: (self picturesDirectoryPath / 'elephant-in-room.png') ]
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide2_4: aSlide [
	<gtSlide>
	<text: '# 2.4 The Cognitive Gap

We all program everyday --not machines, but people.
We express behavior naturally using rules, examples and constraints.
That''s how think.

For example...

However, in traditional programming, we''re basically forced to translate --both forward and backward--
between our natural way of describing behavior and the structure the system under development should 
have to be executable: control flow, functions, objects, whatever.
'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'The Cognitive Gap');
		paragraphWithFormat: (self
				asText: '
				
Humans "program" every day by giving rules, setting constraints, and coordinating behavior:'),
(self asText: '

        "It it rains, take the umbrella."
        "Wait until everyone is seated before serving dinner."
        "While the plane is flying, the door cannot be opened."') italic,
(self asText: '

We express behavior through scenarios, not algorithms or data structures') bold
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide2_5: aSlide [
	<gtSlide>
	<text: '# 2.5 The Two-End Tunnel Digging Metaphor

David Harel described this tension with this nice metaphor that 
I believe is a very nice description of what software developers have been doing for decades...
'>
	^ aSlide titledTextAndElement
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'The Two-End Tunnel-Digging Metaphor');
		newTextWithFormat: (self asText: '"The efforts to bridge the gap between how people think about a system and the formats that computers can execute, can be viewed as digging a tunnel through a mountain, while working from both ends."') italic, (self asText: '
		--David Harel');
		elementWeight: 0.5;
		element: [ GtFilePictureLiveSlide new
				fileReference: (self picturesDirectoryPath / 'tunnel-digging.png') ]
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide2_6_1: aSlide [
	<gtSlide>
	<text: '# 2.6.1 Digging the Tunnel from Both Ends

Here''s how Harel imagined the problem...

On the left side, we are trying to push "the how" closer to people. 
We''ve raised the abstraction level --from machine code to higher-level languages, OOP, AOP or even moldable development environments like GToolkit.

On the right side, we are trying to push "the what" closer to code.
We''ve invented richer ways to capture our understanding --from OOAD to TDD, DDD, Event Storming, etc.

But yet, the gap in the middle is the costly and error-prone process of programming today.
'>
	^ aSlide titledTextAndElement
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'The Two-End Tunnel-Digging Metaphor');
		newTextWithFormat: '';			
		elementWeight: 1;
		element: [ GtFilePictureLiveSlide new
				fileReference: (self picturesDirectoryPath / 'tunnel-digging-explained1.png') ]
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide2_6_2: aSlide [
	<gtSlide>
	<text: '# 2.6.2 Digging the Tunnel from Both Ends

But yet, we, as software developers, are the ones basically digging the mountain and moving back and forth
through that tunnel, translating human understanding (at the right side of the mountain) 
into the executable artifacts (at the left side), and again translating the machine''s code back
intro human meaning when we need understand the software to fix or evolve it.
'>
	^ aSlide titledTextAndElement
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'Continuous Translation');
		newTextWithFormat: (self asText:'This '), (self asText: 'costly and error-prone continuous translation') bold, 
		(self asText:' --back and forth-- through this tunnel is our process of programming today.');
		newTextWithFormat: (self asText: 'BP is an effort to align both ends: "The What" and "The How"');
		elementWeight: 0.5;
		element: [ GtFilePictureLiveSlide new
				fileReference: (self picturesDirectoryPath / 'tunnel-digging-explained1.png') ]
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide2_7_1: aSlide [
	<gtSlide>
	<text: '# 2.7 Can Programming Be Liberated?
	
But, why the tunnel is so hard to complete.

Several authors have written about the constraints of programming. 
For example, John Backus in hist Turing Award lecture in 1977 titled "Can Programming Be Liberated from the von Neumann Style?".

In 2008 Harel published a pun intended essay titled "Can Programming Be Liberated, Period?"
'>
	^ aSlide titledTextAndElement
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'Can Programming Be Liberated?');
		newTextWithFormat: '';	
		elementWeight: 1;																	
		element: [ GtFilePictureLiveSlide new
				fileReference: self picturesDirectoryPath / 'can-programming-be-liberated.png' ]
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide2_7_2: aSlide [
	<gtSlide>
	<text: '# 2.7 The Three Straightjackets of Programming

In this article, Harel points to three main issues or straightjackets of programming.

These are the walls inside the mountain that exlain why the gap persists.

The first --that we must express programs as symbolic artifacts-- is something that he tried to address with his earlier work on Scenario-Based Programming and the Play-In technique, allowing us to capture behavior directly from the user interactions.

It''s very interesting, but it''s out of the scope of this talk, because we''re focusing on BP, rather than SBP.

The second one is about something we''ve already mentioned.

The third one --that we must structure behavior according to the system''s structure-- it''s about a kind of tension between
inter-object and intra-object views.
'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'The Three Straightjackets of Programming');
		paragraphWithFormat: (self asText: '
		
In his essay '), (self asText: '"Can Programming Be Liberated, Period?"') italic, 
(self asText: ' (2008), Harel identified three straightjackets that keep programming trapped in the mountain:

    1. The need to express programs as '), (self asText: 'symbolic artifacts') bold, (self asText: ' (text or diagrams).
    2. The need to separate requirements '), (self asText: '(the what)') bold, (self asText: ' from the program '), (self asText: '(the how)') bold, (self asText: '.
    3. The need to structure behavior according to the '), (self asText: 'system structure') bold, (self asText: '.')
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide2_7_3: aSlide [
	<gtSlide>
	<text: '# 2.7 Inter-Object vs Intra-Object Duality

On the one hand, we have inter-object, scenario-based descriptions 
--the way we naturally think, one story cutting across several components 
("one story for all relevant objects").

On the other hand, we have intra-object, state-basd descriptions
--the way systems are traditionally implemented, each module owning its complete description 
("all pieces of stories for one object").
'>
	^ aSlide titledTextAndElement
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'Inter-Object vs Intra-Object Duality');
		newTextWithFormat: '';				
		elementWeight: 1;
		element: [ GtFilePictureLiveSlide new
				fileReference: self picturesDirectoryPath / 'inter-object-vs-intra-object.png' ]
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide2_7_4: aSlide [
	<gtSlide>
	<text: '# 2.7 Inter-Object vs Intra-Object Duality

Behavioral Programming aims to narrow this gap --making inter-object, scenario-based reasoning executable.
'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'Inter-Object vs Intra-Object Duality');
		paragraphWithFormat: (self asText: '
		
Behavioral Programming aims to narrow this gap, making the inter-object, scenario-based reasoning executable.')
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide2_8: aSlide [
	<gtSlide>
	<text: '# 2.8 Motivations Summed Up

The essence of BP is to bring programming closer to how we actually think --one behavior, one scenario at a time.
'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'BP Motivations Summed Up');
		paragraphWithFormat: (self asText: '
		
'), (self asText: 'Goal: ') bold, (self asText: 'Align programming with human reasoning.

'), (self asText: 'Approach: ') bold, (self asText: 'Express behavior directly, incrementally and collaboratively.

'), (self asText: 'Result: ') bold, (self asText: 'A system that emerges from the interaction of behavioral fragments.')
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide3: aSlide [
	<gtSlide>
	<text: '# 3. Hello World ala BP style

All right --enough theory and philosphy for now.

Let''s see Behavioral Programming in action right inside Smalltalk using the Gt4Bp library.
'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: '3. Hello World ala BP style');
		paragraphWithFormat: (self asText: '
		
Let''s start with two b-threads, each representing an event.

They don''t coordinate, so the order is non deterministic.')
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide3_1: aSlide [
	<gtSlide>
	<text: '# 3.1 Hello World (non deterministic variant)

Here we have 2 b-threads --one requesting the "Hello" event, the other "World".

There''s no synchronization between them, so each run may produce a different order: 
sometime "Hello World", sometimes "World Hello".

And that''s perfectly fine — because each behavior acts independently.
What we have so far is pure concurrency without coordination.
'>
	^ aSlide labelAndElement
		setPriority;
		newTextWithFormat: (self asSubtitle: 'Hello World (non deterministic variant)');
		element: [ | lepiterDb ticTacToePage |
			lepiterDb := LeDatabasesRegistry default currentLoadedDefaultLogicalDatabase
					databaseNamed: 'isegorg/gt4bp/lepiter'.
			ticTacToePage := lepiterDb pageNamed: 'Hello World BP (non deterministic)'.
			(GtPager createWrappedOn: (LePagePhlowTool page: ticTacToePage)) maximized ];
		yourself
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide3_2: aSlide [
	<gtSlide>
	<text: '# 3.2 Hello World: Enforcing Order

To enforce the intended order we add a third b-thread.

We don''t modify the existing behavior. We just add another behavior that constraints the interaction.		
'>
	^ aSlide labelAndElement
		setPriority;
		newTextWithFormat: (self asSubtitle: 'Hello World: Enforcing Order');
		element: [ GtPager
				createWrappedOn: (GtPharoMethodCoder forMethod: Gt4BpExamples >> #helloWorldDeterministic)
						asExpandedOnlyElement vFitContentLimited ]
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide3_3: aSlide [
	<gtSlide>
	<text: '# 3.3 Key Takeaways

This tiny example already captures the spirit of Behavioral Programming...
'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'Key Takeaways');
		paragraphWithFormat: (self asText: '
		
    * In BP, behavior is '), (self asText:'modular and incremental') bold, (self asText: '.
    
    * '), (self asText: 'Compositionality') bold, (self asText: ': You can change system''s behavior by adding or removing b-threads, instead of rewriting code.
    
    * System '), (self asText: 'behavior is emergent, not centralized') bold, (self asText: ': each piece contributes to the global story')
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide4: aSlide [
	<gtSlide>
	<text: '# 4. Conceptual Overview of Behavioral Programming
	
Each b-thread is a small, independent scenario 
--a strand of behavior that says: "under these conditions, I want this to happen".

Many b-threads run together concurrently and meet at synchronization points, where they coordinate through shared events.
'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: '4. Conceptual Overview of Behavioral Programming');
		paragraphWithFormat: (self asText: '
A '), (self asText: 'b-thread') bold, (self asText: ' (behavioral thread)') italic, (self asText: ' is an independent line of behavior:'),
(self asText: '

    * Describes '), (self asText: 'what should') bold, (self asText: ' and '), (self asText: 'what shouldn''t') bold, (self asText: ' happen under certain conditions.'), (self asText: '
    * Runs '), (self asText: 'concurrently') bold, (self asText: ' with other b-threads.'), (self asText: '
    * Participates in a '), (self asText: 'global synchronization cycle') bold, (self asText: ' coordinated through shared events.'),
(self asText: '

A '), (self asText: 'Behavioral Program') bold, (self asText: ' or '), (self asText: 'BProgram') bold, (self asText: ' is software consisting of independent b-threads that generate a flow of events.')
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide4_1: aSlide [
	<gtSlide>
	<text: '# 4.1 How It Works Behind the Scenes?
	
When a b-thread reaches a point that requires synchronization, it waits until all other b-threads reach their own
synchronization points.

At these points, each b-thread specifies three sets of events:

• Requested events – proposed to be triggered; the b-thread asks to be notified when any occurs.
• Waited-for events – not requested, but the b-thread wants to be notified when any is triggered.
• Blocked events – events that this b-thread currently forbids from being triggered.

Once all these declarations are collected, the engine then selects one event that is requested and not blocked, and triggers it.

Every b-thread that was waiting for or requesting that event moves forward — others stay paused until the next synchronization point.
'>
	^ aSlide titledTextAndElement
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'How It Works Behind the Scenes?');
		newTextWithFormat: '';
		elementWeight: 1;
		element: [ GtFilePictureLiveSlide new
				fileReference: self picturesDirectoryPath / 'synchronization-protocol.png' ]
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide5: aSlide [
	<gtSlide>
	<text: '# 5. Gt4Bp: When BP meets Smalltalk
	
Gt4Bp is a very early prototype — a basic library that already allows us to execute and even verify Behavioral Programs directly from GToolkit.

Although it was initially developed inside GToolkit, it doesn’t rely heavily on GToolkit-specific features.
So our next step is to evolve it into a generic Behavioral Programming library for all Smalltalk dialects, which we’re calling Bp4St.
'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: '5. Gt4Bp: When BP meets Smalltalk');
		paragraphWithFormat: (self asText: '
		
Gt4Bp') bold, (self asText: ' is a prototype library that brings Behavioral Programming into GToolkit.

    * '), (self asText: 'Execute and verify') bold, (self asText: ' BPrograms directly from GToolkit.
    * Developed in GToolkit, but with minimal GT-specific dependencies.
    * Future evolution: a generic library for '), (self asText: 'any Smalltalk (Bp4St).') bold
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide5_1: aSlide [
	<gtSlide>
	<text: '# 5.2 Gt4Bp Architecture

'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'Gt4Bp''s Architecture');
		paragraphWithFormat: (self asText: '
		
Gt4Bp currently uses '), (self asText: 'BPjs') bold, (self asText: ' — a Behavioral Programming engine written in Java — as its execution and verification core.

To make Smalltalk interoperate smoothly with this engine, we developed a lightweight connector called the '), (self asText: 'BPjs Bridge.') bold, (self asText: '

The bridge acts as an intermediary process between Smalltalk and BPjs, exchanging '), (self asText: 'events in JSON') bold, (self asText: ' format through stdin/stdout.')
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide5_2: aSlide [
	<gtSlide>
	<text: '# 5.2 Gt4Bp Architecture Overview
		
'>
	^ aSlide titledTextAndElement
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'Gt4Bp''s Architecture Overview');
		newTextWithFormat: '';
		elementWeight: 1;
		element: [ GtFilePictureLiveSlide new
				fileReference: self picturesDirectoryPath / 'gt4bp-architecture.png' ]
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide5_3: aSlide [
	<gtSlide>
	<text: '# 5.3 Gt4Bp Features

Event ynchronization and formal verification, are handled by the BPjs Bridge, which delegates them to the Java BPjs engine.

From Smalltalk, however, everything looks unified: you start or stop a program, send events, observe events, vrify and even inspect counterexamples directly in GToolkit.
'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'Gt4Bp Features');
		paragraphWithFormat: (self asText: '
		
Even though Gt4Bp is still a prototype, it already supports:

    * Add b-threads to a BProgram (currently written in Javascript).
    * Run and stop Bprograms.
    * Send external events from Smalltalk to the BP Engine.
    * Receive and visualize emitted events in GToolkit.
    * Verify BPrograms ("safety" properties).
    * Receive verification counterexample traces.')
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide6: aSlide [
	<gtSlide>
	<text: '# 6. A Live Exploration

'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: '6. A Live Exploration');
		paragraphWithFormat: (self asText: '
		
Let''s switch to the '), (self asText: 'live notebook') bold, (self asText: ' (Lepiter) accompanying the Gt4Bp library that describes how the library has been designed and implemented incrementally using the '), (self asText: 'Moldable Literate Programming') bold, (self asText: ' approach.

There you can find the classical TicTacToe example developed step by step as an '), (self asText: 'hybrid application.') bold, (self asText: '

The GUI will live in Smalltalk, and the game’s logic and decision-making will be expressed as b-threads running through Gt4Bp.')
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide6_1: aSlide [
	<gtSlide>
	<text: '# 6.1 TicTacToe Hybrid Application

'>
	^ aSlide labelAndElement
		setPriority;
		newTextWithFormat: (self asSubtitle: 'TicTacToe Hybrid Application');
		element: [ | lepiterDb ticTacToePage |
			lepiterDb := LeDatabasesRegistry default currentLoadedDefaultLogicalDatabase
					databaseNamed: 'isegorg/gt4bp/lepiter'.
			ticTacToePage := lepiterDb pageNamed: 'Implementing incrementally the Tic Tac Toe game using BP'.
			(GtPager createWrappedOn: (LePagePhlowTool page: ticTacToePage)) maximized ]
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide7: aSlide [
	<gtSlide>
	<text: '# 7. The ADVISE Project

'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: '7. The ADVISE Project');
		paragraphWithFormat: (self asText: '
		
ADVISE:') bold, (self asText: ' Advanced Vision on Intelligent Software Engineering.') italic, (self asText: '

A joint research project between Rey Juan Carlos University (URJC) and OSOCO.'), (self asText: '

Goal:') bold, (self asText: '
The project explores how AI agents can participate meaningfully in software development — not replacing engineers, but assisting them to ensure that the code produced truly reflects human intentions and satisfies requirements.')
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide7_1: aSlide [
	<gtSlide>
	<text: '# 7.1 ADVISE: Two Approaches

'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'ADVISE: Two Complementary Approaches');
		paragraphWithFormat: (self asText: '

OSOCO:') bold, (self asText: '
Scenario-Based Modeling (SBM)') italic, (self asText: ' -- inspired by LSCs, Play-In/Play-Out and BP.'), (self asText: '

URJC:') bold, (self asText: '
Specify-Test-Check-Loop (STCL)') italic, (self asText: ' -- inspired by TDD and practices in FOSS projects.')
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide7_2: aSlide [
	<gtSlide>
	<text: '# 7.2 ADVISE: A Vision of Wise Computing

'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'ADVISE: A Vision of Wise Computing');
		paragraphWithFormat: (self asText: '

The frameworks are meant to '), (self asText: 'augment human expertise, not eliminate it.') bold, (self asText: '

Inspired by David Harel’s vision of '), (self asText: 'Wise Computing') bold, (self asText: ':

'), (self asText: 'The computer as an active, collaborative member of the development team.') italic, (self asText: '

    * Asks questions.
    * Offers suggestions and observations.
    * Performs verification proactively.')
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide7_3: aSlide [
	<gtSlide>
	<text: '# 7.3 ADVISE: The Role of OSOCO: SMToolkit
'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'ADVISE: SMToolkit');
		paragraphWithFormat: (self asText: '

The role of OSOCO within ADVISE is to lead the development on '), (self asText: 'SMToolkit') bold, (self asText: ' (Scenario Modeling Toolkit).') italic, (self asText: '

SMToolkit aims to support '), (self asText: 'Scenario-Based Modeling') italic, (self asText: ' (SBM) through:

    * A '), (self asText: 'Live Sequence Chart (LSC) editor') bold, (self asText: '.
    * '), (self asText: 'LSC snippets') bold, (self asText: ' embeddable in Lepiter notebooks.
    * LLM assistants to help to '), (self asText: 'create LSCs from natural-language descriptions') bold, (self asText: '.
    * A mechanism to '), (self asText: 'execute LSCs as Behavioral Programs') bold, (self asText: '.
    * Support for building (micro)services usig LSCs on notebooks as their '), (self asText: 'executable domain models.') bold
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide8: aSlide [
	<gtSlide>
	<text: '# 8. Why Behavioral Programming Matters
	
If I had to summarize Behavioral Programming in one idea,
it’s about focusing on what should happen rather than how to make it happen.

It lets us describe behaviors incrementally and compositionally,
verify them formally, and connect human reasoning directly to execution.

It’s more than a technique — it’s a step towards turning our understanding into executable knowledge.
'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: '8. Why Behavioral Programming Matters');
		paragraphWithFormat: (self asText: '

Behavioral Programming') bold, (self asText: '
brings a new way of thinking about software.


    * Focus on '), (self asText: 'behavior, not structure.') bold, (self asText: '
    * Add new logic '), (self asText: 'incrementally') bold, (self asText: ', without breaking existing code.
    * Specify '), (self asText: 'partial, cooperating') bold, (self asText: ' views of system behavior.
    * Enable '), (self asText: 'verifiable execution') bold, (self asText: '.

'), (self asText: 'A step towards turning our understanding into executable knowledge.') bold
]

{ #category : #slides }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slide9: aSlide [
	<gtSlide>
	<text: '# 9. Q&A
	
Thank you so much for your attention.
I’d love to hear your questions or thoughts
'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: '9. Q&A');
		paragraphWithFormat: (self asText: '

Thank you for your attention.
'), (self asText: 'Questions or thoughts?') bold, (self asText: '


—
Rafael Luque · OSOCO

'), (self asText: 'Introducing Behavioral Programming with Smalltalk
The Quest for Executable Knowledge') italic, (self asText: '

https://osoco.es')			
]

{ #category : #accessing }
Gt4BpIntroducingBPWithSmalltalkSlideshow >> slidePriorities [
	<gtExample>
	<return: #Array>
	^ #(#slide0: 
	    #slide1_1: #slide1_2:
	    #slide2: #slide2_1: #slide2_2: #slide2_3: #slide2_4: #slide2_5: #slide2_6_1: #slide2_6_2: #slide2_7_1: #slide2_7_2: #slide2_7_3: #slide2_7_4: #slide2_8:
	    #slide3: #slide3_1: #slide3_2: #slide3_3:
	    #slide4: #slide4_1:
	    #slide5: #slide5_1: #slide5_2: #slide5_3:
	    #slide6: #slide6_1:
	    #slide7: #slide7_1: #slide7_2: #slide7_3:
	    #slide8:
	    #slide9:)
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

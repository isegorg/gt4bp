Class {
	#name : #Gt4BpHomeSection,
	#superclass : #GtHomeMultiCardSection,
	#category : #'Gt4Bp-GToolkit-UI'
}

{ #category : #example }
Gt4BpHomeSection >> gtGt4BpBookCard [
	<gtSectionCard>
	<gtExample>
	<noTest>
	^ GtHomeCard lepiterBaseWithTableOfContents
		title: 'Gt4Bp Design Book';
		description: 'Read this Moldable Literate Programming book about Gt4Bp';
		priority: 10;
		pageName: 'Gt4BP: Behavioral Programming on GToolkit';
		databaseName: 'isegorg/gt4bp/lepiter';
		readMoreToolbar;
		details: [ :db | 
			| snippets somePages |
			somePages := db pages select: #shouldAppearInIndexOrDailyNotes.
			snippets := somePages flatCollect: #allChildrenDepthFirst.
			'This book describes step by step the design and build of Gt4Bp library using the Moldable Literate Programming approach in '
				, somePages size asString , ' pages containing '
				, snippets size asString , ' snippets of '
				, (snippets groupedBy: #class) size asString , ' different kinds.' ]
				yourself
]

{ #category : #example }
Gt4BpHomeSection >> gtSmalltalks2025TalkCard [
	<gtSectionCard>
	<gtExample>
	<noTest>
	<return: #GtJobHomeCard>
	
	^ Gt4BpHomeCard job
		title: 'Smalltalks 2025 Talk';
		description: 'Open the Smalltalks 2025 Talk slideshow';
		priority: 20;
		cardSize: 500@250;
		block: [ GtPresenterSlideShow openInSpace: Gt4BpIntroducingBPWithSmalltalkSlideshow ];
		yourself
]

{ #category : #accessing }
Gt4BpHomeSection >> sectionTitle [
	^ 'Gt4Bp: Behavioral Programming in GToolkit'
]

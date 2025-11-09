# Gt4Bp: A Behavioral Programming library for GToolkit Smalltalk

## Installation

```st
Metacello new
	repository: 'github://isegorg/gt4bp:main/src';
	baseline: 'Gt4BP';
	load
```

### Load Lepiter

After installing with Metacello, you will be able to execute the following expression in order to load the library's notebook containing explanations about its design, implementation, and examples of use:

```
#BaselineOfGt4BP asClass loadLepiter
```

## License


  - Gt4Bp is open-sourced under the MIT license.
  - Gt4Bp uses the BPjs as its BP runtime and verification core. The project page and source code can be found at [BPjs's Github Repository](https://github.com/bThink-BGU/BPjs)

## Moldable Literate Programming

In order to improve the **distributed cognition** and sharing of the **theory** behind the Gt4BP's design with any member of our current team or anyone else approaching this software system in the future, we've decided to follow a design and software construction technique that combines the advantages of **Moldable Development** (by *Tudor Girba and his GToolkit team*) with **Literate Programming** (by *Donald Knuth*).
		
The resulting approach is what we call **Moldable Literate Programming** or **Live Literate Programming** and consists of taking the explanations contained in a Lepiter notebook as the source of truth of a software system.
		
As a result of these ideas, in this project's repository, you'll only find this notebook with explanations about the design and implementation details as the only system's sources.

### Motivation

This approach allows us to close (or at least reduce) the traditional gap between the explanations about the *theories* (in the sense of Peter Naur's Theory) behind a software system, normally in the form of design documents, code comments, etc., and what the system actually is, represented by its source code as the source of truth.

**Moldable Literate Programming** is an approach towards considering the explanations as the source of truth, instead of the source code, which can be  viewed as a side product of those explanations.

### So, where is the source code?

The process of generating the source code from the explanations is called **tangle**, as in the classical Literate Programming.

You can read all the chapters in this Lepiter notebook and proceed to evaluate all the included snippets one by one. This way, you can understand and build the software system step-by-step.

You can also use a simple extension of the **Lepiter** tool ([Lepiter-Literate](https://github.com/blueplanelabs/lepiter-literate)) that allows you to tangle a single Lepiter page or the entire database knowledge (notebook).

You can load that extension by evaluating the following code fragment:

```smalltalk
Metacello new
	repository: 'github://blueplanelabs/lepiter-literate:main/src';
	baseline: 'LepiterLiterate';
	load
```

Once you've loaded the *Lepiter-Literate* tools, you can see buttons with a 'play' icon both at the Lepiter page's header and at the knowledge database level.

This button simply evaluates all of the snippets of code included in a single page or in all the database's pages (following the order of pages in the ToC), and this way you can easily *tangle* the code in a single operation.

#import "../sty.typ": *

#show: template.with(
  title: [Types & Effects: Overview],
  short_title: [CSC2126H LEC0101],
  description: [
    Notes based on lectures for CSC 2126H\ (Topics in PL: Types and Effects)\ at the University of Toronto by Professor Ningning Xie, Fall 2024
  ],
  date: datetime(year: 2024, month: 09, day: 09),
)

#quote(block: true, quotes: true)[The goal of types and effects is *to reason about program properties*.]


= Introduction

This lecture is intended as an general overview of all topics covered in the course.

We'll cover six topics in this course, and generally, they can be classified as follows:
/ Statics: Substructural Types, DT
/ Modularity: Module Systems (OCaml, SML)
/ Efficiency: Modal Types (so there exists specific ways to ask compiler to generate efficient code)
/ Effects: Effect Types (tyck, also include monads), Effect Handlers (algbraic properties, cool!)

= Questions

There are three basic questions to ask when talking about types and effects:

/ What is a _program_?: syntax, typing, computation
/ What is its _property_?: soundness (progress & preservation), normalization, equivalence, decidability (type checking)
/ How _decidable_?: type inference (e.g. System F is undecidable), type equivalence (e.g. generally undecidable for DT)

In addition, we will also discuss additional questions for each topic.

= Substructural Types

*Motivation*: Resource management (e.g. files, memory)

/ Program: where a resource is used in a restricted way (ordering/use count)
/ Property: eliminate invalid states

== Categories

*E* Exchange *W* Weakening *C* Contraction

/ Ordered: ?
/ Linear (E): must be used exactly once
/ Affine (E W): must be used at most once
/ Relevant (E C):
/ Normal (E W C): can be used arbitrarily

And, we will try to answer the following questions:
+ How to enforce restrictions with typing?
+ How to design dynamics?
+ Any other useful senario? (ref. ATAPL)

= Dependent Types

*Motivation*: Expressive types (e.g. length-indexed Vec)

/ Program: terms in types (`Vec 3 Int`)
/ Decidability: type equivalence is generally undecidable

And, we will try to answer the following questions:
+ How to write programs in DT? (consider C.H., e.g. Rocq, Agda, ...)
+ How to compile DT programs? (erasure v.s. proof-preserving transformations?) (_this is what we mainly focus in this course, and papers on this topic could be hard to read. Use caution!_)

= Module Systems

*Motivation*: Modularity (e.g. assemble well-specified components, recall ML modules)

/ Program: a modular system assembled from separate components
/ Property: modularity, data abstraction (not allow users to access exact types of a module, and only allow them to access the methods)

And, we will try to answer the following questions:
+ How to design its _core language_?
+ Higher-order modules? (e.g. Module functors in OCaml) First-class modules? (_This is where abstract types could go wrong_)
+ Problems of complex module systems? (_LightQuantum: like what?_)

= Modal Types (& Code Gen)

*Motivation*: Tell compilers how to specialize programs (e.g. _staging_)

(_So, we focus more on code generation in this course_)

/ Program: annotated with modal types that indicate _stages_
/ Property: codegen properties (e.g. well-typedness: $forall c: "Program", "well-typed" c -> "well-typed" #raw("translate")\(c)$)

And, we will try to answer the following questions:
+ Logic foundation? (_temporal logic_/contextual modal logic, _we focus on temporal logic in this course_)
+ Properties? (equivalence between original and generated code)
+ Practical applications? (e.g. efficient compilers by futamura projections)

= Effect Types

*Motivation*: Reason about effects (e.g. IO, exceptions) (hsk: monads)

/ Program: track computational effects (e.g. monads)
/ Property: safety (capture effects and ordering)

And, we will try to answer the following questions:
+ What are the different effect systems?
+ How to reason about effects?
+ Applications? (e.g. optimization by leveraging pureness / no entanglement property?)

= Effect Handlers

*Motivation*: effectful programs with algebraic properties (e.g. Koka/OCaml)

/ Program: ditto
/ Property: ditto

And, we will try to answer the following questions:
+ What is the _algebraic_ part of algeff handlers?
+ monads vs algeffs?
+ How to design a practical language with effect handlers? (e.g. Koka)
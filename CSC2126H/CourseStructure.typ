#import "../sty.typ": *

#show: template.with(
  title: [Types & Effects: Course Structure],
  short_title: [CSC2126H LEC0101],
  description: [
    Notes based on lectures for CSC 2126H\ (Topics in PL: Types and Effects)\ at the University of Toronto by Professor Ningning Xie, Fall 2024
  ],
  date: datetime(year: 2024, month: 09, day: 09),
)

= Per-Week Schedule

- 3 student presentations (20 mins) followed by discussions (5 mins)
- 1 mini-lecture on next week's topic (30 mins)

= Tasks

+ Attend the intro lecture (previous week)
+ Background reading (skim all papers)
+ Read papers (if selected for presentation)
+ Submit a review document (if not selected for presentation)
  - 1 page, need to use templates
  - Answer to questions (e.g. what do you think of effects? not typical textbook questions)
  - Ask 2-3 questions for discussion

== Paper Presentation

Everyone needs to:
- Present: 1 paper
- Judge: 2 presentations

All presentations will be judged by Ningning and 2 students.

A judge is required to:
- Eval: good? bad? What part is particularly good/bad?
- Lead discussion
- Feedback: Google form

== Course Project

Dig into a listed topic.

Individual / 2 people

#attention[
  Proposals can *not* be changed after submission.
]

=== Potential Topics

From simple to challenging:

+ Implement a prototype of a paper (could be an unlisted one but needs justification)
+ Mechanize the proofs in a classic paper (like subst lemma, etc.)
+ Extend a paper with a new feature
+ Relevant explorations (open-ended, but need to justify)

#note[
  Need to arrange one meeting with the instructor/TA to discuss the project before the proposal.
  - What you want to do and why you want to do it.
  - Convince that it's a good project.
  - Will get feedback: good? not going to work?
]

= Timeline

/ Proposal: Oct 14
/ Progress Presentation: Week 7
/ Final Presentation: Last 2 weeks
/ Report: Dec 23

= Grade

/ Review: $5% times 4 = 20%$, top 4 reviews out of 5.
/ Presentation: $15%$
/ Judge: $5% times 2 = 10%$

/ Project: $55%$
  + Proposal: $15%$
  + Presentations: $20%$
  + Report: $20%$

= High-Mark Suggestions

== Review

+ Be critical: Question their assumptions and results. Can things be done differently?
+ Summarize the paper
+ Analyse its strength/weakness, judging its:
  - writing, structure, flow
  - explanation of key techniques
  - key lemmas
  - sense-making?
  - practicalness
  - limitations
  - assumptions
  - evaluations
  - comparisons
  - generalisability
  - any significant lack of details/discussions?

#note[
  *Ref*:
  + #link("http://ccr.sigcomm.org/online/files/p83-keshavA.pdf")[How to Read a Paper (S. Keshav)]
  + #link("https://www.eecs.harvard.edu/~michaelm/postscripts/ReadPaper.pdf")[How to read a research paper (Michael)]
]

Grade standard:
- Understanding
- Insights
- Writing quality (repetition, grammar, gibberish, etc.)

*DO NOT*:
+ Too critical: no positive feedback
+ Too much quote: not your own words! please summarize
+ No evidence: no proof of your claims
+ Vague: "maybe good maybe not idk"

#note[
  _ChatGPT_: can be used to polish writing, but do not use it to generate irrelavant nonsense.
]

== Presentation

+ Engage: eye contact, interaction
+ Emphasize key points
+ Bring people along
+ Explain the prolem
+ Bring out the key idea
+ One key example: one problem followed by one fix, explaining why the idea works!

#note[
  *Ref* #link("https://www.youtube.com/watch?v=sT_-owjKIbA&ab_channel=MicrosoftResearch")[How to give a great research talk (Simon L. Peyton Jones)]

  *Recommendation* Watch others' presentations and notice their structure, strength, and weakness.
]

*DO NOT*:
+ Read slides
+ No engagement with audience: did they follow?
+ Wall of text
+ #text(red)[*OVERRUN*: _strictly enforced_], 20 mins, will get reminded at 15 mins.

== Judge

+ Evaluate: fair (irrelevant to the topic/presenter)
+ Articulate: clarity (good/bad parts, and why?)
+ Appraise
+ Criticize: being constructive (reason + feedback, e.g. lack of context? too technical?)

Grade standard:
- Analysis of pros/cons
- Constructive feedback

*DO NOT*:
+ grumpy/rude/arrogant/nitpicking
+ unhelpful

== Project Proposal

+ Topic: choose something you're interested in, and make sure it's:
  - Feasible
  - Practical
  - Interesting
+ Personal Strength: whether you excel in
  - design/implementation? (implemented in another language? performance improvements?), or
  - analysis? (limitation of current approach? fix?), or
  - evaluation/proofs? (add/mechanize/prove new features)
+ Originality: has been done vs. _can be done_

Grade standard:
- Understanding
- Depth in insight & analysis
- Originality
- Clarity of plan

*DO NOT*:
+ Irrelevant: _NO MACHINE LEARNING!!!_ (unless it's really useful, then one needs to arrange a meeting to justify it)
+ Analyse shallowly: vaguely describe the pros/cons
+ Too ambitious: not feasible. Remember to discuss with the instructor/TA in advance.
+ Too trivial: one-day project
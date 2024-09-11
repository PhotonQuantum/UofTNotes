#import "/sty.typ": *

#show: template.with(
  title: [SAT (WIP)],
  short_title: [CSC2108H LEC0101],
  description: [
    Notes based on lectures for CSC 2108H\ (Automated Reasoning with Machine Learning)\ at the University of Toronto by Professor Xujie Si, Fall 2024
  ],
  date: datetime(year: 2024, month: 09, day: 09),
)

#attention[
  This lecture was incomplete.
]

= Syntax

/ Variables: $w, x, y, z$
/ Literals: $x, not y$ _(negation)_
/ Clauses: $x or y$ _(disjunction)_
/ Formula: $(x or y) and z$ _(conjunction of disjunctions)_
/ Model: $M = \{x arrow top, y arrow bot\}$ _(assignments)_
/ Result: SAT/UNSAT

= Notations

Alternative set-theoretic notations.

/ Literals: $i$ as $x_i$, $-i$ as $not x_i$
/ Clauses: ${x_1, not x_2, x_3}$ or ${1, -2, 3}$
/ Formula: ${c_1, c_2, c_3}$, e.g. ${1, -2, 3}, {-1, 2, -3}$
/ Model: ${x_1 arrow top, x_2 arrow bot, x_3 arrow top}$ or ${1, -2, 3}$

== DIMACS

```sat
c Comment
c DIMACS
p cnf 3 2
1 2 -3 0
-2 3 0
c Solution:
s 1 -2 3
```

= Preprocessing

+ Remove pure literals (e.g. $top$)
+ Remove tauto clauses (e.g. $x_1 or not x_1 or x_2$)
+ Subsumption: If there's a formula ($c_1 and c_2$), and $c_1 arrow.double c_2$ then we can remove $c_2$ (e.g. $x_1 arrow.double (x_1 or x_2)$)
+ Unit propagation _a.k.a. Boolean Constant Propagation_ (e.g. a clause consists of a single lit $x$, then $x$ must be true)

= DPLL

Given a formula $G$,

1. Do _BCP_ *Can be optmized*
2. if $G = top$ return True, or $G = bot$ return False
3. $p arrow.l "Choose"(G)$ (choose a variable to set) *Can be optimized*
4. return $"DPLL"(G\{p arrow top\}) or "DPLL"(G\{p arrow bot\}$)

== Optimize BCP

/ 2-watched lit: pick two lits to watch for each clause, because if a clause with two or more non-falsified lits, it doesn't affect the search

TODO add more details

== Optimize Choose (branching heuristics)

*Intuition*: Pick the most _active_ lit.

But, how to define _active_?
/ DLIS: Count apperance of all lits and pick the _most appeared_ lit
/ VSIDS: Make a score for all vars, and add score for vars _visited in a learnt clause_. _Decay_ the score for all vars over time.

= CDCL

== Decision Levels

The n-th variable we guess (choose, i.e. unit propagated vars do not count) is at level n.

TODO add decision level figure

== Horn Clause

#definition("Horn Clause")[
  A clause with at most one positive literal
]

#example[
  $not 1 or not 2 or not 3 or dots or h$ is a Horn clause,
  because other than $h$ all literals are negated
]

The most interesting part about Horn clauses is that they can be represented as an implication:
$not 1 or not 2 or not 3 or dots or h$ is equivalent to $1 and 2 and 3 and dots arrow.double h$

We'll see how this is useful in the next section.

== Key Idea of CDCL

*Intuition*: Suppose at decision level $n$ we find a conflict. We want to memorize this and never make the same mistake again.

TODO add image here

A naive approach is: we just negate the guess, e.g. Made guess $\{1, 8, -7\}$, we know that $not x_1 or not x_8 or x_7$.

With the naive approach, we are back-tracking chronologically, i.e. back-tracking to the last decision level. E.g. we've just assigned $x_7 arrow bot$, and there's a conflict, we back-track to $x_7 arrow top$.

Now we claim that we can do better: what if we can find the minimum clause (cut) that causes the conflict?

== Non-chronological backtracing

Given the cut, rather than back-tracking to the last decision level, we can back-track using the cut.

Like, if we are now at $1, 8, -7$, normally we will try $1, 8, 7$, but with a cut of $1, 4$ we can try $1, -4$.
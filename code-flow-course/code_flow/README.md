# CodeFlow

## Notice

This project is a companion to the "Thinking Elixir - CodeFlow" course,
published by Mark Ericksen. Copyrights apply to this code. It may not be used to
create training material, courses, books, articles, and the like. Contact me if
you are in doubt. I make no guarantees that this code is fit for any purpose.

Visit https://thinkingelixir.com/available-courses/code-flow/ for course
information.

## Introduction

"Code Flow" or ability to have branching logic, is key for all programming
languages.

In Elixir, we have the following:

- pattern matching
- is functional
- has language specific features
- and has different behaviors around what is otherwise familiar code

These differences allow us to solve old familiar problems in new ways! There are
significant benefits to these new ways so it is definitely worth learning.

## Instructions

This is a TDD (Test Driven Development) project. Use the project locally and
complete the code to make the tests pass.

Here's a natural progression I recommend.

- `mix test test/railway_test.exs` - Railway Pattern

Add a code line number while focusing on a specific test. `:10`

```
mix test test/railway_test.exs:10
```

## Solutions

There is a separate `solutions` branch with examples of how the code can be
implemented. **Don't peak!** Work out your own solutions before looking at other
ways to solve it. You learn best by doing.

In order to see the solutions, you should either commit your code on the
`master` branch or stash your work.

### Commiting Changes

```
git add .
git commit -m "my code flow solutions"
```

Then you can checkout the solutions branch.

```
git checkout solutions
```

### Stashing Changes


# Pattern Matching

## Notice

This project is a companion to the "Thinking Elixir - PatternMatching" course,
published by Mark Ericksen. Copyrights apply to this code. It may not be used to
create training material, courses, books, articles, and the like. Contact me if
you are in doubt. I make no guarantees that this code is fit for any purpose.

Visit https://thinkingelixir.com/available-courses/pattern-matching/ for course
information.

## Introduction

Pattern matching is a fundamental and powerful part of Elixir.

Pattern matching is even used as a replacement for traditional `if` conditionals. It really can change the way you write code! And it's for the better!

## Instructions

This is a TDD (Test Driven Development) project. Clone the project locally and complete the code to make the tests pass.

Here's a natural progression I recommend.

- `mix test test/maps_test.exs` - Map matching
- `mix test test/tuples_test.exs` - Tuple matching
- `mix test test/lists_test.exs` - List matching
- `mix test test/structs_test.exs` - Struct matching
- `mix test test/binaries_test.exs` - Binary and string matching
- `mix test test/guard_clauses_test.exs` - Guard clauses

Add a code line number while focusing on a specific test. `:10`

```
mix test test/maps_test.exs:10
```

## Solutions

There is a separate `solutions` branch with examples of how the code can be implemented. **Don't peak!** Work out your own solutions before looking at other ways to solve it. You learn best by doing.

In order to see the solutions, you should commit your code on the `master` branch.

```
git add .
git commit -m "my pattern matching solutions"
```

Then you can checkout the solutions branch.

```
git checkout solutions
```
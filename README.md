# purescript-console-browser-specific

[![Latest release](https://img.shields.io/github/release/matthewleon/purescript-console-browser-specific.svg)](https://github.com/matthewleon/purescript-console-browser-specific/releases)
[![Build status](https://travis-ci.org/matthewleon/purescript-console-browser-specific.svg?branch=master)](https://travis-ci.org/matthewleon/purescript-console-browser-specific)

PureScript wrappers for JavaScript console functions that are available on some browsers, but are not guaranteed to work, or work consistently, across all platforms.

On platforms where the functions in question are not supported, they will throw exceptions that can be handled using the tools in [`Control.Monad.Eff.Exception`](https://pursuit.purescript.org/packages/purescript-exceptions/2.0.0/docs/Control.Monad.Eff.Exception).

See the tests for usage examples.

## QA

QA in a browser is probably more instructive than running the tests in node:

  - install dependencies with `npm install`
  - run `npm run qa`
  - open the page in `qa/index.html`
  - check your browser's console and web tools.

## Installation

```
bower install purescript-console-browser-specific
```

## Documentation

Module documentation is [published on Pursuit](http://pursuit.purescript.org/packages/purescript-console-browser-specific/).

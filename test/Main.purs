module Test.Main where

import Control.Monad.Eff.Console.BrowserSpecific

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, errorShow, log)
import Control.Monad.Eff.Exception (EXCEPTION, catchException)

import Prelude (Unit, bind, discard, void)

-- most of this will print errors outside of a browser
main :: Eff (console :: CONSOLE) Unit
main = do
  logExceptionAsError do
    log "this will be erased"
    clear

  logExceptionAsError (dir {a: "b", c: [1, 2, 3]})

  logExceptionAsError timeStamp

  logExceptionAsError trace

  logExceptionAsError do
    timer <- time "example"
    timeEnd timer

  logExceptionAsError do
    _ <- time "example"
    timeEnd' "example"

  logExceptionAsError do
    timeEff "another example" (log "time me")

  logExceptionAsError do
    prof <- profileLabeled "example"
    profileEndLabeled prof

  logExceptionAsError do
    profile
    profileEnd

  logExceptionAsError do
    let c = counter "example"
    countLabel c
    countLabel c

  logExceptionAsError do
    count
    count

  logExceptionAsError do
    group do
      log "outer group"
      groupCollapsed do
        log "collapsed inner group"

  logExceptionAsError do
    group'
    log "outer group"
    groupCollapsed'
    log "collapsed inner group"
    groupEnd'

  where
    logExceptionAsError
      :: forall eff a.
         Eff (console :: CONSOLE, exception :: EXCEPTION | eff) a
      -> Eff (console :: CONSOLE | eff) Unit
    logExceptionAsError eff = catchException errorShow (void eff)

-- | See individual modules for detailed documentation.

module Control.Monad.Eff.Console.BrowserSpecific (
  module Control.Monad.Eff.Console.BrowserSpecific.Timer
, module Control.Monad.Eff.Console.BrowserSpecific.Profile
, module Control.Monad.Eff.Console.BrowserSpecific.Count
, module Control.Monad.Eff.Console.BrowserSpecific.Group
, clear
, dir
, timeStamp
, trace
) where

import Control.Monad.Eff.Console.BrowserSpecific.Timer (Timer, time, timeEnd, timeEnd', timeEff)
import Control.Monad.Eff.Console.BrowserSpecific.Profile (Profile, profile, profileEnd, profileLabeled, profileEndLabeled, profileEndLabeled')
import Control.Monad.Eff.Console.BrowserSpecific.Count (LabeledCounter, count, countLabel, counter)
import Control.Monad.Eff.Console.BrowserSpecific.Group (group, group', groupCollapsed, groupCollapsed', groupEnd')

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Exception (EXCEPTION)
import Data.Unit (Unit)

-- | Clears the console.
-- |
-- | https://developer.mozilla.org/en-US/docs/Web/API/Console/clear
foreign import clear
  :: forall eff
  .  Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Unit

-- | Displays an interactive list of an object's properties.
-- |
-- | https://developer.mozilla.org/en-US/docs/Web/API/Console/dir
foreign import dir
  :: forall eff t
  .  t
  -> Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Unit

-- | Add a marker in the browser's Timeline or Waterfall.
-- |
-- | https://developer.mozilla.org/en-US/docs/Web/API/Console/timeStamp<Paste>
foreign import timeStamp
  :: forall eff
  .  Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Unit

-- | Outputs a stack trace to the console.
-- |
-- | https://developer.mozilla.org/en-US/docs/Web/API/Console/trace
foreign import trace
  :: forall eff
  .  Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Unit

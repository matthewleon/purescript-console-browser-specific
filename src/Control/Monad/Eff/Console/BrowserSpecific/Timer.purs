-- | Timers are a handy tool for minimalist ad-hoc profiling.
-- |
-- | For a more detailed tool, check
-- |`Control.Monad.Eff.Console.BrowserSpecific.Profile`.
-- | See the links below for further detail.

module Control.Monad.Eff.Console.BrowserSpecific.Timer (
  Timer
, time
, timeEnd
, timeEnd'
, timeEff
) where

import Control.Applicative (pure)
import Control.Bind (bind, discard)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Exception (EXCEPTION)

import Data.Function (const)
import Data.Functor ((<$>))
import Data.Unit (Unit)

-- | Construct a `Timer` using `time` and consume it with `timeEnd`.
-- |
-- | See the example below.
newtype Timer = Timer String

-- | Start a timer.
-- |
-- | https://developer.mozilla.org/en-US/docs/Web/API/Console/time
-- | Example:
-- | ``` purescript
-- | main :: forall eff. Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Unit
-- | main = do
-- |   timer <- time "example"
-- |   timeEnd timer
-- | ```
time
  :: forall eff.
     String
  -> Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Timer
time timerName = const (Timer timerName) <$> time' timerName

-- | End a timer and write the timing message to the console.
-- |
-- | https://developer.mozilla.org/en-US/docs/Web/API/Console/timeEnd
timeEnd
  :: forall eff.
     Timer
  -> Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Unit
timeEnd (Timer timerName) = timeEnd' timerName

-- | Time an effect, writing the timing message to the console.
timeEff
  :: forall a eff.
     String
  -> Eff (console :: CONSOLE, exception :: EXCEPTION | eff) a
  -> Eff (console :: CONSOLE, exception :: EXCEPTION | eff) a
timeEff timerName eff = do
  timer <- time timerName
  res <- eff
  timeEnd timer
  pure res

foreign import time'
  :: forall eff
   . String
  -> Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Unit

-- | End a timer using only its label string.
-- |
-- | Useful in those cases where, for whatever reason, you can't access
-- | the `Timer` you constructed using `time`.
foreign import timeEnd'
  :: forall eff
   . String
  -> Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Unit

-- | Counters simply log the number of times they have been called.
-- |
-- | https://developer.mozilla.org/en-US/docs/Web/API/Console/count

module Control.Monad.Eff.Console.BrowserSpecific.Count (
  LabeledCounter
, counter
, count
, countLabel
) where

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Exception (EXCEPTION)
import Data.Unit (Unit)

-- | Used only by `countLabel`, below.
newtype LabeledCounter = LabeledCounter String

-- | Construct a `LabeledCounter`.
counter :: String -> LabeledCounter
counter = LabeledCounter

-- | Increment and log a counter.
-- |
-- | ``` purescript
-- | main :: forall eff. Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Unit
-- | main =
-- |   let c = counter "example"
-- |   countLabel c -- 1
-- |   countLabel c -- 2
-- | ```
countLabel
  :: forall eff.
     LabeledCounter
  -> Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Unit
countLabel (LabeledCounter s) = countLabel' s

-- | Increment and log the number of times this function has been called.
foreign import count
  :: forall eff
  .  Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Unit

foreign import countLabel'
  :: forall eff
   . String
  -> Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Unit

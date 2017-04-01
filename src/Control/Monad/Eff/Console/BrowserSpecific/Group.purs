-- | Groups are an esthetic tool for creating indented series of log messages.

module Control.Monad.Eff.Console.BrowserSpecific.Group (
  group,
  groupCollapsed,
  group',
  groupCollapsed',
  groupEnd'
) where

import Control.Applicative (pure)
import Control.Bind (bind, discard)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Exception (EXCEPTION)
import Data.Unit (Unit)

-- | Indent a series of log messages.
-- |
-- | https://developer.mozilla.org/en-US/docs/Web/API/Console/group
-- | Example:
-- | ``` purescript
-- | main :: forall eff. Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Unit
-- | main = do
-- |   log "not indented"
-- |   group do
-- |     log "indented"
-- |     log "indented"
-- |   log "not indented"
-- | ```
group
  :: forall eff a
   . Eff (console :: CONSOLE, exception :: EXCEPTION | eff) a
  -> Eff (console :: CONSOLE, exception :: EXCEPTION | eff) a
group action = do
  group'
  res <- action
  groupEnd'
  pure res

-- | Indent a series of log messages, collapsed behind a disclosure arrow.
-- |
-- | https://developer.mozilla.org/en-US/docs/Web/API/Console/groupCollapsed
-- | Example:
-- | ``` purescript
-- | main :: forall eff. Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Unit
-- | main = do
-- |   log "not indented"
-- |   groupCollapsed do
-- |     log "hidden, indented"
-- |     log "hidden, indented"
-- |   log "not indented"
-- | ```
groupCollapsed
  :: forall eff a
   . Eff (console :: CONSOLE, exception :: EXCEPTION | eff) a
  -> Eff (console :: CONSOLE, exception :: EXCEPTION | eff) a
groupCollapsed action = do
  groupCollapsed'
  res <- action
  groupEnd'
  pure res

-- | https://developer.mozilla.org/en-US/docs/Web/API/Console/group
foreign import group'
  :: forall eff
   . Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Unit

-- | https://developer.mozilla.org/en-US/docs/Web/API/Console/groupCollapsed
foreign import groupCollapsed'
  :: forall eff
   . Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Unit

-- | https://developer.mozilla.org/en-US/docs/Web/API/Console/groupEnd
foreign import groupEnd'
  :: forall eff
   . Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Unit

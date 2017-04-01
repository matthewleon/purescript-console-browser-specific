-- | Functions for working with JS performance profilers.
-- |
-- | For quick timing, check
-- |`Control.Monad.Eff.Console.BrowserSpecific.Timer`.
-- | See the links below for further detail.

module Control.Monad.Eff.Console.BrowserSpecific.Profile (
  Profile
, profile
, profileEnd
, profileLabeled
, profileEndLabeled
, profileEndLabeled'
) where

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Control.Monad.Eff.Exception (EXCEPTION)

import Data.Function (const)
import Data.Functor ((<$>))
import Data.Unit (Unit)

-- | Construct a `Profile` using `profileLabeled`
-- | and consume it with `profileEndLabeled`.
-- |
-- | See the example below.
newtype Profile = Profile String

-- | Start a labeled profile.
-- |
-- | https://developer.mozilla.org/en-US/docs/Web/API/Console/profile
-- | Example:
-- | ``` purescript
-- | main :: forall eff. Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Unit
-- | main = do
-- |   prof <- profileLabeled "example"
-- |   profileLabeledEnd prof
-- | ```
profileLabeled
  :: forall eff.
     String
  -> Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Profile
profileLabeled label = const (Profile label) <$> profileLabeled' label

-- | Stop a labeled profile.
-- |
-- | https://developer.mozilla.org/en-US/docs/Web/API/Console/profileEnd
profileEndLabeled
  :: forall eff.
     Profile
  -> Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Unit
profileEndLabeled (Profile label) = profileEndLabeled' label

foreign import profileLabeled'
  :: forall eff
   . String
  -> Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Unit

-- | Stop profiling using only a profile's label string.
-- |
-- | Useful in those cases where, for whatever reason, you can't access
-- | the `Profile` you constructed using `profileLabeled`.
foreign import profileEndLabeled'
  :: forall eff
   . String
  -> Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Unit

-- | Start an unlabeled profile.
-- |
-- | https://developer.mozilla.org/en-US/docs/Web/API/Console/profile
foreign import profile
  :: forall eff
   . Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Unit

-- | Stop the most recent profile.
-- |
-- | https://developer.mozilla.org/en-US/docs/Web/API/Console/profileEnd
foreign import profileEnd
  :: forall eff
   . Eff (console :: CONSOLE, exception :: EXCEPTION | eff) Unit

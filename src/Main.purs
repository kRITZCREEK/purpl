module Main where

import Prelude

import Control.Monad.Eff (Eff, kind Effect)
import Control.Monad.Eff.Console (CONSOLE, log)
import Control.Monad.Eff.Exception (EXCEPTION)
import Data.Maybe (Maybe(..))
import Data.Monoid (mempty)
import Node.Process (stdin)
import Node.ReadLine (READLINE, close, createConsoleInterface, createInterface, noCompletion, prompt, setLineHandler, setPrompt)
import Purpl (createContext, evalSync, jsonparse)

main :: forall eff. Eff (readline :: READLINE, console :: CONSOLE, exception :: EXCEPTION | eff) Unit
main = do
  ctx ← createContext {}
  interface <- createInterface stdin mempty
  prompt interface
  setLineHandler interface $ \s ->
    if s == "quit"
       then close interface
       else do
        { result } ← evalSync (jsonparse s) (Just ctx)
        log result
        prompt interface

{-# LANGUAGE TemplateHaskell   #-}

module Data.Bitcoin.ScriptSpec where

import           Data.Bitcoin.Script

import qualified Data.ByteString.Char8      as BS8 (pack)
import qualified Data.ByteString.Lazy.Char8 as BSL8 (pack)

import           Test.Hspec

spec :: Spec
spec = do
  describe "when decompiling a specific script" $ do
    it "encoding a decoding a script results in the original hex" $ do
      let hex = BSL8.pack "76a914975efcba1e058667594dc57146022ec46560a63c88ac"

      (encode . decode) hex `shouldBe` hex

    it "succesfully parses a script into a meaningful object" $ do
      let hex     = BSL8.pack "76a914975efcba1e058667594dc57146022ec46560a63c88ac"
          decoded = decode hex

      case decoded of
       (Script [OP_DUP, OP_HASH160, OP_PUSHDATA _ OPCODE, OP_EQUALVERIFY, OP_CHECKSIG]) -> return ()
       _                 -> expectationFailure ("Result does not match expected: " ++ show decoded)

    it "succesfully parses an OP_RETURN script into a meaningful object" $ do
      let hex     = BSL8.pack "6a0b68656c6c6f20776f726c64"
          decoded = decode hex

      decoded `shouldBe` (Script [OP_RETURN, OP_PUSHDATA (BS8.pack "hello world") OPCODE])

module Bitcoin.ScriptSpec where

import           Bitcoin.Script             (decode, encode)
import           Bitcoin.Script.Types

import qualified Data.ByteString.Lazy.Char8 as BSL8 (pack)

import           Test.Hspec
import           Test.Hspec.Expectations    (expectationFailure)

spec :: Spec
spec = do
  describe "when decompiling a specific script" $ do
    it "encoding a decoding a script results in the original hex" $ do
      let hex = BSL8.pack "76a914975efcba1e058667594dc57146022ec46560a63c88ac"

      (encode . decode) hex `shouldBe` hex

    it "succesfully parses a transaction into a meaningful object" $ do
      let hex     = BSL8.pack "76a914975efcba1e058667594dc57146022ec46560a63c88ac"
          decoded = decode hex

      case decoded of
       (Script [OP_DUP, OP_HASH160, OP_PUSHDATA _ OPCODE, OP_EQUALVERIFY, OP_CHECKSIG]) -> return ()
       _                 -> expectationFailure ("Result does not match expected: " ++ show decoded)

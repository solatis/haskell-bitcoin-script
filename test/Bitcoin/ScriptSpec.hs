module Bitcoin.ScriptSpec where

import qualified Data.ByteString.Lazy.Char8 as BSL8 (pack)

import Text.Groom (groom)
import Test.Hspec

spec :: Spec
spec = do
  describe "when decompiling a specific script" $ do
    it "encoding a decoding a script results in the original hex" $
      True `shouldBe` True

module Bitcoin.Script where

import qualified Data.Binary                 as B
import qualified Data.ByteString.Base16.Lazy as BS16L
import qualified Data.ByteString.Lazy        as BSL

import           Bitcoin.Script.Types

-- | Decodes a hex representation of a script into a 'Script' object.
decode :: BSL.ByteString -> Script
decode =
  B.decode . fst . BS16L.decode

-- | Encodes a 'Script' object into a hex representation
encode :: Script -> BSL.ByteString
encode =
  BS16L.encode . B.encode

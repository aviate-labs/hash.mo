import Blob "mo:base-0.7.3/Blob";
import Debug "mo:base-0.7.3/Debug";
import Text "mo:base-0.7.3/Text";

import CRC32 "../src/CRC32";

assert(CRC32.checksum([171,205,1]) == 591393286);
assert(CRC32.checksum(Blob.toArray(Text.encodeUtf8("The quick brown fox jumps over the lazy dog"))) == 1095738169);

let crc32 = CRC32.CRC32();
var data = Blob.toArray(Text.encodeUtf8("The quick bro"));
crc32.update(data);

data := Blob.toArray(Text.encodeUtf8("wn fox jumps "));
crc32.update(data);

data := Blob.toArray(Text.encodeUtf8("over the lazy dog"));
crc32.update(data);

assert(crc32.finish() == 1095738169);
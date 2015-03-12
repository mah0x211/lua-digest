lua-digest
=========

message digest module.

---

## Dependencies

- jose: https://github.com/mah0x211/lua-jose
- siphash: https://github.com/mah0x211/lua-siphash


## Installation

```sh
luarocks install digest --from=http://mah0x211.github.io/rocks/
```

## Functions

- `bin, err = digest.md5( src:string [, key:str] )`
- `bin, err = digest.ripemd160( src:string [, key:str] )`
- `bin, err = digest.whirlpool( src:string [, key:str] )`
- `bin, err = digest.sha1( src:string [, key:str] )`
- `bin, err = digest.sha224( src:string [, key:str] )`
- `bin, err = digest.sha256( src:string [, key:str] )`
- `bin, err = digest.sha384( src:string [, key:str] )`
- `bin, err = digest.sha512( src:string [, key:str] )`

**Parameters**

- `src:str`: message string.
- `key:str`: secret key string.

**Returns**

1. `bin:userdata`: binary on success. or, a nil on failure.
2. `err:str`: error message.

**Usage**

```lua
local digest = require('digest');
local src =[[ !"#$%&\'()*+,-./\n
0123456789
:;<=>?@
ABCDEFGHIJKLMNOPQRSTUVWXYZ
[\]^_`
abcdefghijklmnopqrstuvwxyz
{|}~]];
local key = 'my secret key';
local bin, err = digest.sha256( src, key );

print( bin:toHex() );       -- df863906c26576f8d83eb897b8cab3c9150f54705c9a70efc453cce4083ecac2
print( bin:toBase64() );    -- 34Y5BsJldvjYPriXuMqzyRUPVHBcmnDvxFPM5Ag+ysI=
print( bin:toBase64URL() ); -- 34Y5BsJldvjYPriXuMqzyRUPVHBcmnDvxFPM5Ag-ysI
```


### digest.siphash*

- `hex, err = digest.siphash24( src:string [, key:str ] )`
- `hex, err = digest.siphash48( src:string [, key:str ] )`



**Parameters**

- `src:str`: message string.
- `key:str`: maximum 128 bit length (<=16 byte) secret key string.

**Returns**

1. `hex:str`: hex-encoded string on success, or a nil on failure.
2. `err:str`: error message about a key argument length.


**Usage**

```lua
local digest = require('digest');
local src =[[ !"#$%&\'()*+,-./\n
0123456789
:;<=>?@
ABCDEFGHIJKLMNOPQRSTUVWXYZ
[\]^_`
abcdefghijklmnopqrstuvwxyz
{|}~]];
local key = 'my secret key';
local hex, err = digest.siphash24( src, key );

print( hex );   -- f4fabbbf384ea152
```

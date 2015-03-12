local digest = require('digest');
local src = '{"baz":"hello","foo":{"bar":1}}';
local key = 'test key';
local res;

for _, def in ipairs({
    {
        name = 'md5',
        nokey = '76b8bdb0c99670ffc52bd4423b077995',
        key = 'b871d0d36606cecb994d93f4de92efa8'
    },
    {
        name = 'ripemd160',
        nokey = '5b3148650328fd4102256549edf0ff9ef252ad83',
        key = '05ef2d01480e4c709bd4254c7025a5dbdf2664b1'
    },
    {
        name = 'whirlpool',
        nokey = '7938a0efe129dc294bf52ae827f4e16fb3b19fe432bb9ff4c09fb0192474af837ebab36d3c767b864282998a79a02efdaa0ce7de3cdfb42c4696865dda1348d8',
        key = '850fee4e2aaf1ba6fab7064a3fba340dac3e5b1998b0c58c19732456dfb7758de10c72dedfdf8631959c9b3b2dddb833bd38eacaa6fe4275f638bc82eee2039b'
    },
    {
        name = 'sha1',
        nokey = 'bb6b6554504a4fec2f64f493ed2be2d0c447dbdb',
        key = '53215e7288d3bf91fff950b58f8c2908eefa95b0'
    },
    { 
        name = 'sha224',
        nokey = 'b82f368fd62553945745741502a2c46ee94ce16b83a044f569e68789',
        key = '64f7e16243f3daaf411df1bdc6fa38e23fa50bfa7e45fb0fbf7da989'
    },
    { 
        name = 'sha256',
        nokey = 'd712653e1ae58ecf6ed612a8a95a4cfb77146bc7e438d07ae76af79ea56196de',
        key = '9913ea3b1ea0f95a40accb5dc888fa355f25745fd4e1ae4448d633fbe7523704'
    },
    {
        name = 'sha384',
        nokey = '224919d9f36df928bfac09db9f5b7047cea9a96cd03fa86461a9d887706d3ddcd7b5d92521bff1efac6fa41134a3812a',
        key = '7b72250cd2fe8ac358c9b852b87b3351c8e97792e325e72b28e40a2c15d26e824955c7572f8a0d0c8d8c8e1b6c3ad935'
    },
    {
        name = 'sha512',
        nokey = '7708d97f4f251cb91f9ac1df4bcc282514d57e05f8cfa652a2bca063645a8974a74d6b7a3634aba7a5539f559aedc7f3a6dc587d7828fa913035bd5e83840b3e',
        key = '7d165b805efd9777d6d21ac19da711d8259622c5eab7b6e730844ea316a15badb0b3c1fd0f2e19f787ba836a96993ccc0a9d97237136ba7356c0441e2b482bd8'
    },
    {
        name = 'siphash24',
        nokey = '51344ca70d74fae8',
        key = '05f7edd4be34d425'
    },
    {
        name = 'siphash48',
        nokey = '65957f20e50355ec',
        key = '289706e6dc14e149'
    }
}) do
    -- siphash returns hex-string
    if def.name:find('^siphash') then
        -- with key
        res = ifNil( digest[def.name]( src, key ) );
        ifNotEqual( res, def.key );
    
        -- without key
        res = ifNil( digest[def.name]( src ) );
        ifNotEqual( res, def.nokey );
        
    -- other returns binary data
    else
        -- with key(HMAC)
        res = ifNil( digest[def.name]( src, key ) );
        ifNotEqual( res:toHex(), def.key );
        
        -- without key
        res = ifNil( digest[def.name]( src ) );
        ifNotEqual( res:toHex(), def.nokey );
    end
end


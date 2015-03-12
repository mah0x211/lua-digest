--[[
  
  Copyright (C) 2015 Masatoshi Teruya

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:
 
  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.
 
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.

 
  digest.lua
  lua-digest
  
  Created by Masatoshi Teruya on 15/03/12.
  
--]]
-- module
local Digest = require('jose.digest');
local siphash = require('siphash');

-- wrapper
local function digest( alg, data, key )
    local d, err = Digest.new( alg, key );
    local ok;
    
    if err then
        return nil, err;
    end
    
    ok, err = d:update( data );
    if err then
        return nil, err;
    end
    
    return d:final();
end

local function md5( ... )
    return digest( 'md5', ... );
end

local function ripemd160( ... )
    return digest( 'ripemd160', ... );
end

local function whirlpool( ... )
    return digest( 'whirlpool', ... );
end

local function sha1( ... )
    return digest( 'sha1', ... );
end

local function sha224( ... )
    return digest( 'sha224', ... );
end

local function sha256( ... )
    return digest( 'sha256', ... );
end

local function sha384( ... )
    return digest( 'sha384', ... );
end

local function sha512( ... )
    return digest( 'sha512', ... );
end


return {
    md5         = md5,
    ripemd160   = ripemd160,
    whirlpool   = whirlpool,
    sha1        = sha1,
    sha224      = sha224,
    sha256      = sha256,
    sha384      = sha384,
    sha512      = sha512,
    siphash24   = require('siphash').encode24,
    siphash48   = require('siphash').encode48
};


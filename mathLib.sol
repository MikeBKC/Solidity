pragma solidity ^0.5.1;

library mathlib{
    function add(uint a,uint b) pure public returns(uint){
        uint c = a + b;
        assert(c >= a && c >= b);
        return c;
    }

    function getthis() public view returns(address){
        return address(this);
    }
}

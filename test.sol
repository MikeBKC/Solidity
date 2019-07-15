pragma solidity ^0.5.1;

contract Testbool{
    bool a = true;
    bool b = false;
    function add(uint x,uint y) public pure returns(uint){
        uint z = x+y;
        return z;
    }
}

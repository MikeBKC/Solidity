pragma solidity ^0.5.1;

contract Mutex{
    bool public locked;

    modifier Mutexfuc{
        require(!locked);
        locked = true;
        _;
        locked = false;
    }
    function f() public Mutexfuc returns(uint){
        return 7;
    }
}


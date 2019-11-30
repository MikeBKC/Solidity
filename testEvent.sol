pragma solidity ^0.5.1;

contract Event{
    event Testevent(address a,uint b);

    function test() public payable{
        emit Testevent(msg.sender,msg.value);
    }
}

contract Event1 is Event{
    function test1() public payable{
        emit Testevent(msg.sender,msg.value);
    }
}

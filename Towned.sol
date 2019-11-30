pragma solidity ^0.5.1;

contract owned{
    address public owner;
    constructor() public{
        owner = msg.sender;
    }

    modifier Ownerd{
        require(msg.sender == owner);
        _;
    }

    function transferowner(address new_owner) public Ownerd{
        owner = new_owner;
    } 
}

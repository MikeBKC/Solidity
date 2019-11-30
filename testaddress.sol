pragma solidity ^0.5.1;

contract TestAddr{
    constructor() public payable{

    }
    function testBalance() public returns (uint){
        address test = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
        return test.balance;
    }

    function testSelBalance() public returns (uint){
        address test = address(this);
        return test.balance;
    }
    function testTrans(address payable  a) public{
        address test = address(this);
        /*1eth = 10^18wei*/
        if(test.balance >= 1 ether){
            address(a).transfer(1 ether);
        }
    }
    /*
       function testBalance(address a) public returns (uint){
       return a.balance;
       }
     */
}

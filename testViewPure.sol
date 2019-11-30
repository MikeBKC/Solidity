pragma solidity ^0.5.1;

contract testView{
    uint public b = 1;
    // view no use gas. local run
    // pure no read and write ,local run too 
    function test(uint a) public view returns(uint){
        return a+b;
    }  
    function tt(uint x) public pure returns(uint){
        return x+2;
    }

}

pragma solidity ^0.5.1;
import "./mathLib.sol";

//https://github.com/OpenZeppelin/openzeppelin-contracts    
contract testlib{
    function testadd(uint x,uint y) pure public returns(uint){
        return mathlib.add(x,y);
    }
    //调用库但是合约中this表示的是本合约地址
    function testget() view public returns(address){
        return mathlib.getthis();
    }
}

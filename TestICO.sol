pragma solidity ^0.5.1;

import "./Towned.sol";

interface token{
    function transfer(address _to,uint256 num) external;
}
contract ICO{
    uint256 public  ethNum;
    uint256 public  Price;
    uint256 public  Time;
    uint256 public deadline;
    token public TokenAddr;
    mapping(address=>uint) BalanceOf;
    constructor(uint256 num,uint256 p,uint256 time,address Taddr) public{
        ethNum = num;
        Price = p * 1 ether;
        Time = time;
        TokenAddr = token(Taddr);
        deadline = now + 1 minutes * time;
    }

    function() external payable{
        require(now <= deadline);
        uint amount = msg.value; //1 wei
        uint num = amount/Price;

        TokenAddr.transfer(msg.sender,num);
    }

}

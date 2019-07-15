pragma solidity ^0.5.1;

contract TestABI{
    uint value;
    function set(uint x) public{
        value = x;
    } 

    function abiEncode() public pure returns(bytes memory){
        return abi.encode(1);//计算参数ABI编码

        //return abi.encodeWithSignature("set(uint256)",2);//计算函数ABI编码
    }
}

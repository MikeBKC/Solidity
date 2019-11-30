solidity ^0.5.1;

//fallback函数当找不到合适的时会调用，默认的
contract testfullback{
    uint public x;
    function() external payable{
        //  x = 1;
    }
}

contract testCall{
    //合约转账必须将构造设置为payable 
    constructor() public payable{

    }

    function getbalance() public view returns(uint){
        return address(this).balance;
    }
    function Call(address a) public {
        address(a).call(abi.encode(0x123456));
    }

    function trasfer(address payable a) public{
        address(a).transfer(1 ether);
    }
}

pragma solidity ^0.5.1;

contract Called{
    uint public n;
    address public sender;

    function setN(uint _n) public payable{
        n = _n;
        sender = msg.sender;
    }
    event logdata(bytes data);

    function() external payable{
        // emit logdata(msg.data);
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}

contract CallTest{
    function CallSetN(address payable _e,uint _n) public{
        bytes memory payload = abi.encodeWithSignature("setN(uint256)",_n);
        (bool success, bytes memory returnData) = _e.call.value(2 ether)(payload);
        require(success);
    }

    constructor() public payable{
    }
    function transferEther(address payable towho) public returns(bool){
        assert(towho.send(1 ether));
    }
}

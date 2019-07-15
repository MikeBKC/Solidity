pragma solidity ^0.5.1;

contract called{
    function testCalled() public view returns(address){
        return tx.origin; //origin sender
        //return msg.sender; //latest sender
    }
}

contract BlockAPI{
    function getmsg() public payable returns(address,uint){
        return (msg.sender,msg.value);
    }
    /* gas to big
       function getgas() public returns(uint256){
       uint256 a = gasleft();
       uint c = 1 + 2;
       uint256 b = gasleft();
       return b-a;
       }
     */
    function getsig() public pure returns(bytes4){
        return msg.sig;
        //return this.getsig.selector;
    }

    function testcall() public returns(address){
        return new called().testCalled();
        //return this.getsig.selector;
    }
}

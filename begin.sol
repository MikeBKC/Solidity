pragma solidity ^0.5.1;

contract Simplestorage {
    uint storedData;
    bytes2 test = "dc";
    function set(uint x) public{
        storedData = x;
    }
    enum TestEnum{
        FirstOne,
        Two,
        Three,
        Four
    }
    TestEnum getvar = TestEnum.Four;
    function get() public returns(uint){
        return storedData;
    }

    function getArray() public pure returns(byte){
        bytes2 test = "dc";
        return test[0];
    }
    function getenum() public  returns(uint){
        return uint(getvar);
    }

}
/*
 * test
 */

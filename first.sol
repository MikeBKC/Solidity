import "./first_interface.sol";

contract Simplestorage {
    uint storedData;

    event Set(uint value);
    //define modifier 
    modifier mustover10 (uint value){
        require(value>=10);
        _;
    }
    function set(uint x) public mustover10(x){
        storedData = x;
        emit Set(x);
    }
    function get() public returns(uint){
        return storedData;
    }
}

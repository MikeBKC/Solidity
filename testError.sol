pragma solidity ^0.5.1;

contract testError{
    function  testdiv(uint x, uint y) public pure{
        require(y != 0);
        require(x > y);

        assert(x >= x/y);

        if(x/y == 1){
            revert();
        }
    }
}

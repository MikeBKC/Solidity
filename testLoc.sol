pragma solidity ^0.5.1;

contract TestLoc{
    uint[] x;       //x save in Blockchain

    // memory save in memory
    function f(uint[] memory memArray) public returns(uint[] memory){
        x = memArray;           //copy from mem to storage

        uint[] storage y = x;    //reference x
        y[1] = 2;


        g(x);   //reference trans,can change
        h(x);   //copy to mem,can not change
        return x;
    }

    function g(uint[] storage stgArray) internal{
        stgArray[2] = 6;
    }
    function h(uint[] memory memArray) internal{
        memArray[2] = 7;
    }
}

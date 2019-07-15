pragma solidity ^0.5.1;

contract TestArr{
    uint [7] tens;
    uint[] public b = new uint[](7);

    function getlength() public returns(uint){
        return tens.length;
    }
    /*storage val can change length and push val*/
    function changelength() public returns(uint){
        b.length = 10;
        b.push(20);

        /*   
             uint[] memory c = new uint[](7);
             c.push(30);
             return b.length;

         */
    }



}

pragma solidity ^0.5.1;

contract owner{
    address payable owner;
    //定义一个函数修改器 ，可被继承 
    //修饰时，函数体被插到_处 
    //不符合条件将异常
    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
}
contract testContract is owner{
    /*
       address payable owner;
       constructor () public{
       owner = msg.sender;
       }
     */
    function hello() public pure returns(string memory){
        return "hello";
    }

    modifier over18(uint age){
        require(age >= 18);
        _;
    }
    /*  
    //定义一个函数修改器 ，可被继承 
    //修饰时，函数体被插到_处 
    //不符合条件将异常
    modifier onlyOwner{
    require(msg.sender == owner);
    _;
    }
     */

    //多个modifier一起使用
    //function kill(uint8 age) public onlyOwner over18(age){
    //    //require(owner == msg.addr);
    //    selfdestruct(owner);
    //}

    function kill(uint8 age) public onlyOwner over18(age){
        //require(owner == msg.addr);
        selfdestruct(owner);
    }

    function innocence() public{
        this.hello();
        selfdestruct(owner);
    }
}

contract testCall{

}

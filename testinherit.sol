pragma solidity ^0.5.1;

contract base{
    uint private a;

    function privatefun() pure private{

    }
    function internalfun() pure internal{

    }
    function externalfun() pure external{

    }
    function publicfun() pure public{

    }
}

//继承  
contract test is base{
    function testfunc() public pure{
        internalfun();
        // private no use
        //privatefun(); 
    }

}
//多重继承，test cover base
contract test1 is base,test{


}

interface token{
    function transfer() external;
}

contract ICO{
    token t;
    function buy() public{
        t.transfer();
    }
}
//抽象合约 
contract Abstract {
    function tt() public;
    function tt1() public;
}
//接口合约
interface Testinterface{
    function tt2() external;
    function tt3() external;
}

contract testfun is Abstract,Testinterface{

}



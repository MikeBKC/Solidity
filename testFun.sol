pragma solidity ^0.5.1;

//external use gas more than internal gas
contract TestFunc{
    function a(uint x) internal returns(uint){
        return x * x;
    }
    function b(uint x) internal returns(uint){
        return x;
    }

    function CallTest(bool test,uint m) external returns(uint){
        function (uint) internal returns (uint) f;
        if(test)
            f = a;
        else
            f = b;
        return f(m);

    }
    //0x26121ff0  internal not have selector
    function f() external view returns (bytes4){
        return this.f.selector;
    }
}

pragma solidity ^0.5.1;

import "./Terc20_interface.sol";

contract ERC20 is ERC20interface{
    mapping(address=>uint256) public balanceOf;
    mapping(address=>mapping(address=>uint256)) public allowed;
    address public addr;
    constructor(string memory _name,string memory _symbol) public{
        name = _name;
        symbol = _symbol;
        decimals = 0;
        totalSupply = 10000000;
        balanceOf[msg.sender] = totalSupply;
        addr = msg.sender;
    }

    function transfer(address _to,uint256 _value) public returns (bool success){
        require(_to != address(0));
        require(balanceOf[msg.sender] >= _value);
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        //addr = msg.sender;
        emit Transfer(msg.sender,_to,_value);
        return true;
    }

    function transferFrom(address _from,address _to,uint256 _value) public returns (bool success){
        require(_to != address(0));
        require(allowed[_from][msg.sender] >= _value);
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value >= balanceOf[_to]);

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowed[_from][msg.sender] -= _value;

        emit Transfer(_from,_to,_value); 

        return true;
    }

    function approve(address _spender,uint256 _value) public returns (bool success){
        allowed[msg.sender][_spender] = _value;

        emit Approval(msg.sender,_spender,_value);
        return true;
    }

    function allowance(address _owner,address _spender) public view returns(uint256 remaining){
        return allowed[_owner][_spender];
    }

}

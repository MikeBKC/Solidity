pragma solidity ^0.5.1;

import "./Terc20.sol";
import "./Towned.sol";

contract AddTotal is ERC20,owned{
    mapping(address=>bool) public freezetoken;
    event Addtotal(uint num);
    event FreezeToken(address addr,bool freeze);
    event Burn(address addr,uint256 amount);

    constructor(string memory _name,string memory _symbol) ERC20(_name,_symbol) public{

    }

    function addtoken(address owner,uint amount) public Ownerd{
        totalSupply += amount;
        balanceOf[owner] += amount;

        emit Transfer(owner,owner,amount);
        emit Addtotal(amount);
    }

    function freeze(address addr,bool freeze) public {
        freezetoken[addr] = freeze;
        emit FreezeToken(addr,freeze);
    }

    function burn(uint256 amount) public returns(bool success){
        require(balanceOf[msg.sender] >= amount);
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Burn(msg.sender,amount);    
        return true;
    }

    function transfer(address _to,uint256 _value) public returns(bool success){
        require(!freezetoken[msg.sender]);
        require(_to != address(0));
        require(balanceOf[msg.sender] >= _value);
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender,_to,_value);
        return true;
    }

    function transferFrom(address _from,address _to,uint256 _value) public returns (bool success){
        require(!freezetoken[_from]);
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
}

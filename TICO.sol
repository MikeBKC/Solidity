pragma solidity ^0.5.1;

import "./Towned.sol";


interface token{
    function transfer(address _to,uint amount) external;
}

//ERC20合约地址  addressofToken
contract ICO is owned{
    uint public fundGoal;  //目标
    uint public deadline;
    uint public duration;   //time
    uint public price;  
    token public tokenReward;   //
    address payable public beneficiary; //受益人 
    uint public fundall;

    mapping(address=>uint) public balanceOf;

    event Fundtransfer(address addr,uint amount);
    event GoodICO(bool success);

    constructor(uint fundEth,uint time,uint ethcostp,address addressofToken) public payable{
        beneficiary = msg.sender;
        fundGoal = fundEth * 1 ether;
        duration = time;
        price = ethcostp * 1 ether;  // 1eth = 10 ^ 18 wei
        tokenReward = token(addressofToken);
        deadline = now + duration * 1 minutes;
    }
    /*eth exchange ico token 以太和ICO token兑换*/
    function() external payable{
        require(now < deadline);
        uint amount = msg.value; //wei  单位

        balanceOf[msg.sender] += amount;  //for  record ico account eth num
        fundall += amount;

        uint tokenAmount = 0;
        //空投 
        if(amount == 0){
            tokenAmount = 10;
        }else{
            tokenAmount = amount/price;    //发送给用户的token数量
        }
        tokenReward.transfer(msg.sender,tokenAmount);
        emit Fundtransfer(msg.sender,amount);
    }

    //设置阶梯价格0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db
    function setPrice(uint icoprice) public Ownerd{
        price = icoprice;
    }

    function checkICO() public{
        require(now >= deadline);
        if(fundall >= fundGoal){
            emit GoodICO(true);
        }
    }

    //受益人调用 
    //.transfer表示 转入addr账户token
    function withdrawal() public{
        //require(now >= deadline);
        if(fundall >= fundGoal){
            if(beneficiary == msg.sender){
                beneficiary.transfer(fundall);  //众筹完成，给ICO发起人打币
            }
        }else{
            uint amount  = balanceOf[msg.sender];
            if(amount > 0){
                msg.sender.transfer(amount);
                //众筹未完成，给投资者转回token
                balanceOf[msg.sender]
                    =
                    0;
            }
        }
    }


}

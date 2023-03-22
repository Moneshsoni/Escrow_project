pragma solidity 0.8.9;
contract Escrow{

    //state variables
    address agent;
    mapping(address => uint256 ) public deposits;

    modifier onlyAgent(){
        require(msg.sender == agent,"you are not the agent");
        _;
    }
    constructor (){
        agent = msg.sender;
    }

    function deposit(address payee)public payable onlyAgent{
        uint256 amount = msg.value;
        deposits[payee] = deposits[payee]+amount;
    }

    function withdraw(address payable payee)public onlyAgent {
        uint256 payement = deposit[payee];
        deposit([payee]) =0;
        payee.transfer(payement);
    }


}
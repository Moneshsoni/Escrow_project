pragma solidity 0.8.9;
import "./Escrow.sol";
contract EscrowFactory {

    // constructor(address payable _buyer,address payable _seller,address payable _arbiter)Escrow(_buyer,_seller,_arbiter){
    //     buyer = _buyer;
    //     seller = _seller;
    //     arbiter = _arbiter;
    // }

    Escrow[] public escrowArray;

    function CreateEscrow(address payable _buyer, address payable _seller, address payable _arbiter)public{
        Escrow escrow = new Escrow(_buyer,_seller,_arbiter);
        escrowArray.push(escrow);
    }


    function length_escrow()public view returns(uint){
        return escrowArray.length;
    }

}
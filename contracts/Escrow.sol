    pragma solidity ^0.8.0;

contract Escrow {
    
    address payable public buyer;
    address payable public seller;
    address payable public arbiter;
    
    bool public isBuyerIn;
    bool public isSellerIn;
    bool public isArbiterIn;
    
    constructor(address payable _buyer, address payable _seller, address payable _arbiter) {
        buyer = _buyer;
        seller = _seller;
        arbiter = _arbiter;
    }
    
    function deposit() public payable {
        require(msg.sender == buyer && !isBuyerIn, "Buyer has already deposited or is not authorized to deposit.");
        require(msg.value > 0, "Deposit amount must be greater than zero.");
        isBuyerIn = true;
    }
    
    function confirmDelivery() public {
        require(msg.sender == buyer || msg.sender == arbiter, "Only the buyer or the arbiter can confirm delivery.");
        require(isBuyerIn && isSellerIn, "Both buyer and seller must have deposited funds.");
        seller.transfer(address(this).balance);
    }
    
    function depositForSeller() public payable {
        require(msg.sender == seller && !isSellerIn, "Seller has already deposited or is not authorized to deposit.");
        require(msg.value > 0, "Deposit amount must be greater than zero.");
        isSellerIn = true;
    }
    
    function depositForArbiter() public payable {
        require(msg.sender == arbiter && !isArbiterIn, "Arbiter has already deposited or is not authorized to deposit.");
        require(msg.value > 0, "Deposit amount must be greater than zero.");
        isArbiterIn = true;
    }
    
    function refundBuyer() public {
        require(msg.sender == seller || msg.sender == arbiter, "Only the seller or the arbiter can refund the buyer.");
        require(!isSellerIn || !isBuyerIn || !isArbiterIn, "All parties must have deposited funds.");
        buyer.transfer(address(this).balance);
    }
    
    function refundSeller() public {
        require(msg.sender == buyer || msg.sender == arbiter, "Only the buyer or the arbiter can refund the seller.");
        require(!isSellerIn || !isBuyerIn || !isArbiterIn, "All parties must have deposited funds.");
        seller.transfer(address(this).balance);
    }
    
    function refundArbiter() public {
        require(msg.sender == buyer || msg.sender == seller, "Only the buyer or the seller can refund the arbiter.");
        require(!isSellerIn || !isBuyerIn || !isArbiterIn, "All parties must have deposited funds.");
        arbiter.transfer(address(this).balance);
    }
    
    function withdraw() public {
        require(msg.sender == buyer, "Only the buyer can withdraw funds.");
        require(isSellerIn && isBuyerIn, "Both buyer and seller must have deposited funds.");
        buyer.transfer(address(this).balance);
    }
}



// 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB Buyer
// 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2 seller
// 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db Arbitier
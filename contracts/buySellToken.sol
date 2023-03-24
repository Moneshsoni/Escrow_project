pragma solidity ^0.8.0;

contract BuySellContract {
    address public seller;
    uint public price;
    uint public quantity;
    bool public sold;
    mapping(address => uint) public balances;

    event Bought(address buyer, uint quantity);

    constructor() {
        seller = msg.sender;
        price = 1 ether; // set the price per token to 1 ether
        quantity = 100; // set the total quantity of tokens to sell
        sold = false;
    }

    function buyTokens(uint tokens) public payable {
        require(!sold, "Tokens have already been sold.");
        require(msg.value == price * tokens, "Incorrect payment amount.");

        balances[msg.sender] += tokens;
        quantity -= tokens;

        emit Bought(msg.sender, tokens);

        if (quantity == 0) {
            sold = true;
        }
    }

    function withdraw() public {
        require(sold, "Tokens have not been sold yet.");
        require(msg.sender == seller, "Only the seller can withdraw funds.");

        payable(seller).transfer(address(this).balance);
    }
}
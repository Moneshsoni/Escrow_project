const hre = require("hardhat");
async function main(){
    const BuySellContract = await hre.ethers.getContractFactory("BuySellContract");
    const buySellContract = await BuySellContract.deploy();
    await buySellContract.deployed();
    console.log("Address of buySellContract ",buySellContract.address);
}

main();
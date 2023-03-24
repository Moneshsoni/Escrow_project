require("@nomicfoundation/hardhat-toolbox");
require("dotenv");
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: {
    compilers: [
      {
        version: "0.8.9",
      }
      
    ]
  }
  // networks:{
  //   MumbaiTestnet: {
  //     url: "https://rpc-mumbai.maticvigil.com/",
  //     chainId:80001,
  //     accounts: [process.env.PRIVATE_KEY],
  //   }
  // }
};

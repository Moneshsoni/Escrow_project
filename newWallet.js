const { Currency,  createAccount } = require("@tatumio/tatum");
// const {generateWallet, Currency} = require("@tatumio/tatum");
require("dotenv").config();


const createNewAccount = async () => {
  const createAccountData= {
    currency: Currency.ETH,
    xpub: process.env.pub 
  };
  const accoun = await createAccount(createAccountData);
  console.log(accoun);
};

createNewAccount();
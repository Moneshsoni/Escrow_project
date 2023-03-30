
const {generateWallet, Currency} = require("@tatumio/tatum");
// const {generatePrivateKeyFromMnemonic, Currency} = require("@tatumio/tatum");


async function walle(){

    // Xpub is an abbreviation for an extended public key
    const ethWallet = await generateWallet(Currency.ETH, false);
    console.log(ethWallet);

    // const btcPrivateKey = await generatePrivateKeyFromMnemonic(Currency.ETH, false, "pioneer infant jelly enjoy hold exotic speak lunar cry atom involve zone rally drill paper donkey artist final drive scissors final bargain hawk link", 1);
    // console.log({key: btcPrivateKey});
}

walle();


// pioneer infant jelly enjoy hold exotic speak lunar cry atom involve zone rally drill paper donkey artist final drive scissors final bargain hawk link


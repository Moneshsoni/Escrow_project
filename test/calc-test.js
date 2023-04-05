const {ethers} = require("hardhat");
describe("Deploy calc",async ()=>{
    before(async ()=>{
        accounts  = await ethers.getSigners();
        [user,add1,add2] = accounts;

        CALC = await ethers.getContractFactory("Calc");
        calc = await CALC.deploy();
        await calc.deployed();
    })

    describe("Call method of contract",async ()=>{
        it("check the address",async ()=>{
            console.log("contract add",calc.address);
           
        });
    })
})
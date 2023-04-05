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
        it("Call the add function",async ()=>{
            let a = 10;
            let b = 100;
            await calc.Add(a,b);
        });
        it("Read the sum of the addition",async ()=>{
            console.log("Get the sum",await calc.getAddRes());
        })
    })
})
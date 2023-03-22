pragma solidity 0.8.9;
contract Test{
    uint public a;
    uint public b;
    uint public c;
    bool add;
    bool add1;

    function addA(uint _a)public{
        a=_a;
        add = true; 
    }

    function addB(uint _b)public{
        b=_b;
        add1 = true; 
    }

    function sum()public{
        require(add && add1,"please input the both value");
        c = a+b;
    }
}
pragma solidity ^0.8.13;
contract Calc{
    uint a;
    uint b;
    uint sum;
    function Add(uint _a, uint _b)public{
        a = _a;
        b = _b;
        sum = a+b;
    }

    function getAddRes()public view returns(uint){
        return sum;
    }
}
pragma solidity ^0.4.24;

contract MyContract {
    
 string value;
 
 constructor() public{
     value = "some_value";
 }
 
 function getValue() public view returns(string) {
     return value;
 }
 
 function setValue(string _value) public {
     value = _value;
 }
}
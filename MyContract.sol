pragma solidity ^0.5.1;

contract MyContract {
    
 enum Operations { Sum, Minus}
 Operations internal operations;
 
 function activeSum() public {
     operations = Operations.Sum;
 }
 
 function activeMinus() public {
     operations = Operations.Minus;
 }
 
 function calculate(int a, int b) public view returns(int) {
     if (operations == Operations.Sum) 
        return a + b;    
     return a - b; 
 }
 
}
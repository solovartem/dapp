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
 
 struct Person {
    string _firstname;
    string _lastname;
    int8 age;
 }
 
 Person[] public persons;
 
 function addPerson(string memory name, string memory surname, int8 age) public {
     persons.push(Person(name, surname, age));
 }
 
 mapping(bytes32 => string) public people;
 
 function setExample(bytes32 key, string memory value) public {
     people[key] = value;
 }
 
}
pragma solidity ^0.5.1;

contract MyContract {
    mapping(uint8 => Person) public people;
    uint8 public size = 0;
    address owner;
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    constructor() public {
        owner = msg.sender;
    }
    
    struct Person {
        string _name;
        string _surname;
    }
    
    function addPerson(string memory _name, string memory _surname) public onlyOwner {
        incrementSize();
        people[size] = Person(_name, _surname);
    }
    
    function incrementSize() internal {
        size ++;
    }
    
}
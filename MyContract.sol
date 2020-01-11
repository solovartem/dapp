pragma solidity ^0.5.1;

contract MyContract {
    mapping(uint8 => Person) public people;
    uint8 public size = 0;
    address owner;
    
    uint256 internal openingTime = 1578728829;
    uint256 public time = block.timestamp;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime, "hello world");
        _;
    }
    
    constructor() public {
        owner = msg.sender;
    }
    
    struct Person {
        string _name;
        string _surname;
    }
    
    function addPerson(string memory _name, string memory _surname) public onlyOwner onlyWhileOpen {
        incrementSize();
        people[size] = Person(_name, _surname);
    }
    
    function incrementSize() internal {
        size ++;
    }
    
    event LogUint(string, uint);
    function log(string memory s , uint x) public {
        emit LogUint(s, x);
    }
    
}
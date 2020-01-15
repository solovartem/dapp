pragma solidity ^0.5.1;

contract TimeLock {
    uint256 time = 1579108500;
    address payable public perciever;
    
    constructor (address payable _perciever) public payable {
        perciever = _perciever;
    }
    
    function release() public payable {
        perciever.transfer(address(this).balance);
    }
}
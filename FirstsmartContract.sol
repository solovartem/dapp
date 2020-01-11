pragma solidity ^0.5.1;

contract FirstSmartContract {
    
    mapping (address => uint256) public tokens;
    address payable internal wallet;
    
    event Purchase(address indexed _address, uint256 _amount);
    
    constructor(address payable _wallet) public {
        wallet = _wallet;
    }
    
    function buyToken() external payable {
        tokens[msg.sender] += 1;
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, 1);
    }
}
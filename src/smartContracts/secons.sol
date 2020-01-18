pragma solidity ^0.5.1;

contract SLA {

    address payable seller;
    uint256 public c;
    constructor() payable public {
        seller = msg.sender;
    }

    function Transfer_Contract_Amount() payable public {
        seller.transfer(msg.value);
    }
    
    function sendMoney(address payable y) public {
        c = y.balance;
        y.transfer(100000);
    }
    
    function send(address payable _receiver) payable public {
        _receiver.transfer(msg.value);
    }
}
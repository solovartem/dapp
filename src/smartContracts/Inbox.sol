pragma solidity ^0.5.1;

contract Inbox {
    string message = "208";
    function setMessage(string memory _message) public {
        message = _message;
    }
    function getMessage() public view returns(string memory) {
        return message;
    }
}

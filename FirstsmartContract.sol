pragma solidity ^0.5.1;


contract ERC20Token {
    string name;
    mapping (address => uint256) public balances;
    
    function mint() public {
        balances[tx.origin]++;
    }
}

contract FirstSmartContract {
    
    address payable private wallet;
    address public token;
    
    constructor(address payable _wallet, address _tokenAddress) public {
        wallet = _wallet;
        token = _tokenAddress;
    }
    
    function buyToken() public payable {
        ERC20Token _token = ERC20Token(token);
        _token.mint();
        wallet.transfer(msg.value);
    }
}
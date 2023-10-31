// SPDX-License-Identifier: Unlicenced
pragma solidity 0.8.18;
contract TokenContract {

    address public owner;
    struct Receivers {
        string name;
        uint256 tokens;
    }

    mapping(address => Receivers) public users;
    
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }
    
    constructor(){
        owner = msg.sender;
        users[owner].tokens = 100;
    }
    
    function double(uint _value) public pure returns (uint){
        return _value*2;
    }
    
    function register(string memory _name) public{
        users[msg.sender].name = _name;
    }
    
    function giveToken(address _receiver, uint256 _amount) onlyOwner public{
        require(users[owner].tokens >= _amount);
        users[owner].tokens -= _amount;
        users[_receiver].tokens += _amount;
    }

    function comprarToken(address payable _receiver, uint amount) public payable {
        require(msg.value == amount*5 ether, "Se deben enviar al menos 5 Ether para comprar un token.");
        
        require(users[_receiver].tokens >= amount, "El vendedor no tiene suficientes tokens");
        users[_receiver].tokens -= amount;
        users[msg.sender].tokens += amount;

        _receiver.transfer(amount*5 ether);
        
    }
}
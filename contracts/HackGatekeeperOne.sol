// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IGatekeeperOne {
  function enter(bytes8 _gateKey) external returns (bool);
}

contract HackGatekeeperOne {
  
  function setEntrant(bytes8 _gateKey, address _gatekeeperAddr) public payable {
    IGatekeeperOne gatekeeper = IGatekeeperOne(_gatekeeperAddr);
    gatekeeper.enter(_gateKey);
  }
}       
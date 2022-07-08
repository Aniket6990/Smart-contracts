// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Vault is Ownable {
    uint256 public totalbalance; //total balance of vault
    address public receiver; // address of executor
    bool public sent;

    constructor(address _receiver) payable {
        totalbalance = msg.value;
        receiver = _receiver;
        sent = false;
    }

    function releaseFunds() public onlyOwner {
        sent = true;
        payable(receiver).transfer(totalbalance);
    }
}
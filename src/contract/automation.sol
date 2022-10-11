// SPDX-License-Identifier: MIT
// **** DEPLOYED TO 0x3BcC66f059Ad445b49A2997DbA526faE44aE7e57 on FUJI ****

pragma solidity ^0.8.7;

contract Automate {
    uint256 public num = 0;
    event Counted(uint256 num);
    function count() public {
        num += 1;
        emit Counted(num);
    }
}
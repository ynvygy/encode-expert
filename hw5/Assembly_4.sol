// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Scope {
    uint256 public count = 10;

    function increment()
        public
    /* I eliminated the variable here because it was not required*/ {
        // Modify state of the count variable from within
        // the assembly segment
        assembly {
            // modified by 3
            sstore(0x00, add(sload(0x00), 3))
        }
    }
}

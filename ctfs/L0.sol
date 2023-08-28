// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.21;

// This level is really simple.
// Use the interface bellow to write a smart contract.
// Your contract should contain a function called solution that returns a uint8.
// In this case the function body logic is very simply as the answer is always 42.

contract Level_0_Solution {
    constructor() payable {}

    // Example solution
    // Deployment gas cost: 88093
    function solution() external payable returns (uint8) {
        return 42;
    }

    // First assembly try
    // Deployment gas cost: 87844
    function solutionV2() external payable returns (uint8) {
        assembly {
            pop(0x2A)
        }
    }

    // Storing and returning
    // Deployment gas cost: 87099
    function solutionV3() external payable returns (uint8) {
        assembly {
            mstore(0x40, 0x2A)
            return(0x40, 0x20)
        }
    }

    // Moving the memory pointer to 0x00 to cut costs
    // This was not accepted as a solution, although it does work
    // Deployment gas cost: 86602
    function solutionV4() external payable returns (uint8) {
        assembly {
            mstore(0x00, 0x2A)
            return(0x00, 0x20)
        }
    }

    fallback() external payable {}
}

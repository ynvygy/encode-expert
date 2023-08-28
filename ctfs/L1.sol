// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.21;

// Write a function that adds two matrices returns the result.
// To keep things simple the array sizes will be fixed sizes of 2x2 (uint256[2][2]).
// Take a look at Wikipedia if you need help understanding matrix addition.

contract Level_1_Solution {
    constructor() payable {}

    // First standard try
    // Deployment gas cost: 196011
    function solution(
        uint256[2][2] calldata x,
        uint256[2][2] calldata y
    ) external payable returns (uint256[2][2] memory finalArray) {
        for (uint256 i = 0; i < 2; i++) {
            for (uint j = 0; j < 2; j++) {
                finalArray[i][j] = x[i][j] + y[i][j];
            }
        }
    }

    // Individual assignment
    // Deployment gas cost: 163236
    function solutionV2(
        uint256[2][2] calldata x,
        uint256[2][2] calldata y
    ) external payable returns (uint256[2][2] memory finalArray) {
        finalArray[0][0] = x[0][0] + y[0][0];
        finalArray[0][1] = x[0][1] + y[0][1];
        finalArray[1][0] = x[1][0] + y[1][0];
        finalArray[1][1] = x[1][1] + y[1][1];
    }

    // Moving to Yul
    // Deployment gas cost: 132352
    function solutionV3(
        uint256[2][2] calldata x,
        uint256[2][2] calldata y
    ) external payable returns (uint256[2][2] memory finalArray) {
        assembly {
            mstore(
                add(finalArray, 0x00),
                add(calldataload(add(x, 0)), calldataload(add(y, 0)))
            )
            mstore(
                add(finalArray, 0x20),
                add(calldataload(add(x, 32)), calldataload(add(y, 32)))
            )
            mstore(
                add(finalArray, 0x40),
                add(calldataload(add(x, 64)), calldataload(add(y, 64)))
            )
            mstore(
                add(finalArray, 0x60),
                add(calldataload(add(x, 96)), calldataload(add(y, 96)))
            )
            return(0x80, finalArray)
        }
    }

    // Removing finalArray as a param
    // Adding memory-safe
    // Improving Yul courtesy of i-Nautilus
    // Moving the pointer to 0x40
    // Deployment gas cost: 122625
    function solutionV4(
        uint256[2][2] calldata x,
        uint256[2][2] calldata y
    ) external payable returns (uint256[2][2] memory) {
        assembly ("memory-safe") {
            mstore(0x40, add(calldataload(4), calldataload(132)))
            mstore(0x60, add(calldataload(36), calldataload(164)))
            mstore(0x80, add(calldataload(68), calldataload(196)))
            mstore(0xa0, add(calldataload(100), calldataload(228)))
            return(0x40, 0x80)
        }
    }

    fallback() external payable {}
}

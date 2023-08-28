// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.21;

/**
interface Isolution4 {
    function solution(uint256 value) external;
}
**/

// Using the Isolution4 interface write a function that takes a uint256 and saves it to memory slot 3.
contract Level_4_Solution {
    constructor() payable {}

    // Deployment gas cost: 86589
    function solution(uint256 value) external payable {
        assembly {
            sstore(3, value)
        }
    }

    fallback() external payable {}
}

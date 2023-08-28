// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.21;

/*
interface Isolution7 {
    function solution(address addr) external view returns (uint256 codeSize);
}
*/

// Using the Isolution7 interface write a function that takes an address and returns the codeSize of that address as a uint256.
contract Level_7_Solution {
    constructor() payable {}

    // Deployment gas cost: 92812
    function solution(
        address addr
    ) external payable returns (uint256 codeSize) {
        assembly {
            codeSize := extcodesize(addr)
        }
    }

    // Deployment gas cost: 92302
    function solutionV2(address addr) external payable returns (uint256) {
        assembly ("memory-safe") {
            mstore(returndatasize(), extcodesize(addr))
            return(returndatasize(), 0x20)
        }
    }

    fallback() external payable {}
}

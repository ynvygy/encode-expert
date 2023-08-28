// SPDX-License-Identifier: MIT

pragma solidity 0.8.21;

/**
 * interface Isolution {
 *    function solution(bytes memory packed) external pure returns (uint8, bool, bytes1);
 * }
 * @author @WillSchiller
 */

// Using the Isolution4 interface write a function that unpacks our data that was packed using abi.encodePacked(a, b, c).
// Where a is type uint8, b is type bool and c is type bytes1.

contract Level_3_Solution {
    constructor() payable {}

    // The initial working attempt
    // Deployment gas cost: 128129
    function solution(
        bytes memory packed
    ) external payable returns (uint8 a, bool b, bytes1 c) {
        assembly {
            let packedData := mload(add(packed, 0x20))
            a := byte(0, packedData)
            b := byte(1, packedData)
            c := mload(add(packed, 0x22))
        }
    }

    // Clearing some things, the gas cost went up, but for some reason it got a better score
    // Deployment gas cost: 129136
    function solutionV2(
        bytes memory packed
    ) external payable returns (uint8 a, bool b, bytes1 c) {
        assembly {
            a := mload(add(packed, 0x20))
            b := mload(add(packed, 0x21))
            c := mload(add(packed, 0x22))
        }
    }

    // Method used for testing purposes
    /*function packData() external pure returns (bytes memory packed) {
        packed = abi.encodePacked(uint8(42), true, bytes1(0x12));
    }*/

    fallback() external payable {}
}

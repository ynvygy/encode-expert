// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.21;

// Write a function that sorts an array in ascending order and returns the result.
// The array will be a fixed of 10 but the contents random.
contract Level_2_Solution {
    // Initial sorting network version courtesy of Serge
    // Deployment gas cost: 331774
    function solution(
        uint256[10] calldata unsortedArray
    ) external pure returns (uint256[10] memory) {
        uint256[10] memory sortedArray = unsortedArray;

        if (sortedArray[0] > sortedArray[8]) {
            (sortedArray[0], sortedArray[8]) = (sortedArray[8], sortedArray[0]);
        }
        if (sortedArray[1] > sortedArray[9]) {
            (sortedArray[1], sortedArray[9]) = (sortedArray[9], sortedArray[1]);
        }
        if (sortedArray[2] > sortedArray[7]) {
            (sortedArray[2], sortedArray[7]) = (sortedArray[7], sortedArray[2]);
        }
        if (sortedArray[3] > sortedArray[5]) {
            (sortedArray[3], sortedArray[5]) = (sortedArray[5], sortedArray[3]);
        }
        if (sortedArray[4] > sortedArray[6]) {
            (sortedArray[4], sortedArray[6]) = (sortedArray[6], sortedArray[4]);
        }
        if (sortedArray[0] > sortedArray[2]) {
            (sortedArray[0], sortedArray[2]) = (sortedArray[2], sortedArray[0]);
        }
        if (sortedArray[1] > sortedArray[4]) {
            (sortedArray[1], sortedArray[4]) = (sortedArray[4], sortedArray[1]);
        }
        if (sortedArray[5] > sortedArray[8]) {
            (sortedArray[5], sortedArray[8]) = (sortedArray[8], sortedArray[5]);
        }
        if (sortedArray[7] > sortedArray[9]) {
            (sortedArray[7], sortedArray[9]) = (sortedArray[9], sortedArray[7]);
        }
        if (sortedArray[0] > sortedArray[3]) {
            (sortedArray[0], sortedArray[3]) = (sortedArray[3], sortedArray[0]);
        }
        if (sortedArray[2] > sortedArray[4]) {
            (sortedArray[2], sortedArray[4]) = (sortedArray[4], sortedArray[2]);
        }
        if (sortedArray[5] > sortedArray[7]) {
            (sortedArray[5], sortedArray[7]) = (sortedArray[7], sortedArray[5]);
        }
        if (sortedArray[6] > sortedArray[9]) {
            (sortedArray[6], sortedArray[9]) = (sortedArray[9], sortedArray[6]);
        }
        if (sortedArray[0] > sortedArray[1]) {
            (sortedArray[0], sortedArray[1]) = (sortedArray[1], sortedArray[0]);
        }
        if (sortedArray[3] > sortedArray[6]) {
            (sortedArray[3], sortedArray[6]) = (sortedArray[6], sortedArray[3]);
        }
        if (sortedArray[8] > sortedArray[9]) {
            (sortedArray[8], sortedArray[9]) = (sortedArray[9], sortedArray[8]);
        }
        if (sortedArray[1] > sortedArray[5]) {
            (sortedArray[1], sortedArray[5]) = (sortedArray[5], sortedArray[1]);
        }
        if (sortedArray[2] > sortedArray[3]) {
            (sortedArray[2], sortedArray[3]) = (sortedArray[3], sortedArray[2]);
        }
        if (sortedArray[4] > sortedArray[8]) {
            (sortedArray[4], sortedArray[8]) = (sortedArray[8], sortedArray[4]);
        }
        if (sortedArray[6] > sortedArray[7]) {
            (sortedArray[6], sortedArray[7]) = (sortedArray[7], sortedArray[6]);
        }
        if (sortedArray[1] > sortedArray[2]) {
            (sortedArray[1], sortedArray[2]) = (sortedArray[2], sortedArray[1]);
        }
        if (sortedArray[3] > sortedArray[5]) {
            (sortedArray[3], sortedArray[5]) = (sortedArray[5], sortedArray[3]);
        }
        if (sortedArray[4] > sortedArray[6]) {
            (sortedArray[4], sortedArray[6]) = (sortedArray[6], sortedArray[4]);
        }
        if (sortedArray[7] > sortedArray[8]) {
            (sortedArray[7], sortedArray[8]) = (sortedArray[8], sortedArray[7]);
        }
        if (sortedArray[2] > sortedArray[3]) {
            (sortedArray[2], sortedArray[3]) = (sortedArray[3], sortedArray[2]);
        }
        if (sortedArray[4] > sortedArray[5]) {
            (sortedArray[4], sortedArray[5]) = (sortedArray[5], sortedArray[4]);
        }
        if (sortedArray[6] > sortedArray[7]) {
            (sortedArray[6], sortedArray[7]) = (sortedArray[7], sortedArray[6]);
        }
        if (sortedArray[3] > sortedArray[4]) {
            (sortedArray[3], sortedArray[4]) = (sortedArray[4], sortedArray[3]);
        }
        if (sortedArray[5] > sortedArray[6]) {
            (sortedArray[5], sortedArray[6]) = (sortedArray[6], sortedArray[5]);
        }
        return sortedArray;
    }

    // Rewriting solution but in Yul
    // Deployment gas cost: 270325
    function solutionV2(
        uint256[10] calldata unsortedArray
    ) external payable returns (uint256[10] memory) {
        uint256[10] memory sortedArray = unsortedArray;

        assembly ("memory-safe") {
            let ptr := sortedArray
            let el0 := mload(ptr)
            let el1 := mload(add(ptr, 0x20))
            let el2 := mload(add(ptr, 0x40))
            let el3 := mload(add(ptr, 0x60))
            let el4 := mload(add(ptr, 0x80))
            let el5 := mload(add(ptr, 0xA0))
            let el6 := mload(add(ptr, 0xC0))
            let el7 := mload(add(ptr, 0xE0))
            let el8 := mload(add(ptr, 0x100))
            let el9 := mload(add(ptr, 0x120))
            let tmp

            if gt(el0, el8) {
                tmp := el0
                el0 := el8
                el8 := tmp
            }

            if gt(el1, el9) {
                tmp := el1
                el1 := el9
                el9 := tmp
            }

            if gt(el2, el7) {
                tmp := el2
                el2 := el7
                el7 := tmp
            }

            if gt(el3, el5) {
                tmp := el3
                el3 := el5
                el5 := tmp
            }
            if gt(el4, el6) {
                tmp := el4
                el4 := el6
                el6 := tmp
            }
            if gt(el0, el2) {
                tmp := el0
                el0 := el2
                el2 := tmp
            }
            if gt(el1, el4) {
                tmp := el1
                el1 := el4
                el4 := tmp
            }
            if gt(el5, el8) {
                tmp := el5
                el5 := el8
                el8 := tmp
            }
            if gt(el7, el9) {
                tmp := el7
                el7 := el9
                el9 := tmp
            }
            if gt(el0, el3) {
                tmp := el0
                el0 := el3
                el3 := tmp
            }

            if gt(el2, el4) {
                tmp := el2
                el2 := el4
                el4 := tmp
            }
            if gt(el5, el7) {
                tmp := el5
                el5 := el7
                el7 := tmp
            }
            if gt(el6, el9) {
                tmp := el6
                el6 := el9
                el9 := tmp
            }
            if gt(el0, el1) {
                tmp := el0
                el0 := el1
                el1 := tmp
            }
            if gt(el3, el6) {
                tmp := el3
                el3 := el6
                el6 := tmp
            }
            if gt(el8, el9) {
                tmp := el8
                el8 := el9
                el9 := tmp
            }
            if gt(el1, el5) {
                tmp := el1
                el1 := el5
                el5 := tmp
            }
            if gt(el2, el3) {
                tmp := el2
                el2 := el3
                el3 := tmp
            }
            if gt(el4, el8) {
                tmp := el4
                el4 := el8
                el8 := tmp
            }
            if gt(el6, el7) {
                tmp := el6
                el6 := el7
                el7 := tmp
            }
            if gt(el1, el2) {
                tmp := el1
                el1 := el2
                el2 := tmp
            }
            if gt(el3, el5) {
                tmp := el3
                el3 := el5
                el5 := tmp
            }
            if gt(el4, el6) {
                tmp := el4
                el4 := el6
                el6 := tmp
            }
            if gt(el7, el8) {
                tmp := el7
                el7 := el8
                el8 := tmp
            }
            if gt(el2, el3) {
                tmp := el2
                el2 := el3
                el3 := tmp
            }
            if gt(el4, el5) {
                tmp := el4
                el4 := el5
                el5 := tmp
            }
            if gt(el6, el7) {
                tmp := el6
                el6 := el7
                el7 := tmp
            }
            if gt(el3, el4) {
                tmp := el3
                el3 := el4
                el4 := tmp
            }
            if gt(el5, el6) {
                tmp := el5
                el5 := el6
                el6 := tmp
            }

            mstore(ptr, el0)
            mstore(add(ptr, 0x20), el1)
            mstore(add(ptr, 0x40), el2)
            mstore(add(ptr, 0x60), el3)
            mstore(add(ptr, 0x80), el4)
            mstore(add(ptr, 0xA0), el5)
            mstore(add(ptr, 0xC0), el6)
            mstore(add(ptr, 0xE0), el7)
            mstore(add(ptr, 0x100), el8)
            mstore(add(ptr, 0x120), el9)
        }
        return sortedArray;
    }
}

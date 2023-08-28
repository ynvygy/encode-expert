/**
 *Submitted for verification at Etherscan.io on 2023-08-17
 */

// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.21;

/*
interface Isolution {
    function solution(uint256 b, uint256 ex, uint256 modulus) external returns (uint256 result);
}
*/

// Using the Isolution5 interface calculate Modular Exponentiation (base**exp % mod).
// Implementing it from scratch would take too much gas so you will need to use the precompiled contract at address 0x05
contract Level_5_Solution {
    constructor() payable {}

    // Removed revert to save on gas
    // Deployment gas cost: 97525
    function solution(
        uint256 b,
        uint256 ex,
        uint256 modulus
    ) external payable returns (uint256) {
        assembly {
            let p := mload(0x40)
            mstore(p, 0x20)
            mstore(add(p, 0x20), 0x20)
            mstore(add(p, 0x40), 0x20)
            mstore(add(p, 0x60), b)
            mstore(add(p, 0x80), ex)
            mstore(add(p, 0xa0), modulus)
            if iszero(staticcall(gas(), 0x05, p, 0xc0, p, 0x20)) {
                //revert(0, 0)
            }

            return(p, 0x20)
        }
    }

    fallback() external payable {}
}

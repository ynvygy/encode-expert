// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.21;

/**
interface Isolution6 {
    function solution(address owner, bytes32 messageHash, uint8 v, bytes32 r, bytes32 s) external pure 
    returns (bool isSignedByOwner);
}
**/

// Using the Isolution6 interface write a function that will take the messageHash (plus params) and return the signer of the message.
contract Level_6_Solution {
    constructor() payable {}

    // Deployment gas cost: 134856
    function solution(
        bytes32 messageHash,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external payable returns (address) {
        bytes32 prefixedMessage = keccak256(
            abi.encodePacked("\x19Ethereum Signed Message:\n32", messageHash)
        );

        return ecrecover(prefixedMessage, v, r, s);
    }

    // Deployment gas cost: 108715
    function solutionV2(
        bytes32 messageHash,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external payable returns (address) {
        bytes32 hash = keccak256(
            abi.encodePacked("\x19Ethereum Signed Message:\n32", messageHash)
        );

        assembly {
            let p := mload(0x40)
            mstore(p, hash)
            mstore(add(p, 0x20), v)
            mstore(add(p, 0x40), r)
            mstore(add(p, 0x60), s)
            if iszero(staticcall(not(0), 0x01, p, 0x80, p, 0x20)) {
                //revert(0, 0)
            }
            return(p, 0x20)
        }
    }

    // Deployment gas cost: 107983
    function solutionV3(
        bytes32 messageHash,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external payable returns (address) {
        bytes32 hash = keccak256(
            abi.encodePacked("\x19Ethereum Signed Message:\n32", messageHash)
        );

        assembly {
            mstore(0x40, hash)
            mstore(0x60, v)
            mstore(0x80, r)
            mstore(0xA0, s)
            if iszero(staticcall(not(0), 0x01, 0x40, 0x80, 0x40, 0x20)) {
                //revert(0, 0)
            }
            return(0x40, 0x20)
        }
    }

    fallback() external payable {}
}

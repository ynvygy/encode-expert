// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

// Results using '8' as the item being removed
// Gas costs (transaction cost / execution cost)
// deleteElementV1 -> 90680 (69525 / 52848)
// deleteElementV2 -> 63349 (45486 / 29082)
// deleteElementV3 -> 63333 (45472 / 29068)
// deleteElementV4 -> 62995 (45178 / 28774)
// deleteElementV5 -> 62964 (45151 / 28747)
// deleteElementV6 -> 62948 (45137 / 28733)

contract HwTwo {
    uint256[] public myArray = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

    error HwTwo__InvalidIndex();

    modifier legitIndex(uint256 index) {
        require(index < myArray.length, "Invalid index");
        _;
    }

    // Beginner mode - Web2 style with no optimization in mind
    function deleteElementV1(uint256 _index) public legitIndex(_index) {
        uint256[] memory newArray = new uint256[](myArray.length - 1);
        uint256 newIndex = 0;
        for (uint256 i = 0; i < myArray.length; i++) {
            if (i != _index) {
                newArray[newIndex] = myArray[i];
                newIndex++;
            }
        }
        myArray = newArray;
    }

    // Web3 style with no optimization in mind
    function deleteElementV2(uint256 _index) public legitIndex(_index) {
        for (uint256 i = _index; i < myArray.length - 1; i++) {
            myArray[i] = myArray[i + 1];
        }
        myArray.pop();
    }

    // Dropping the i and just using the index
    function deleteElementV3(uint256 _index) public legitIndex(_index) {
        for (; _index < myArray.length - 1; _index++) {
            myArray[_index] = myArray[_index + 1];
        }
        myArray.pop();
    }

    // Unchecking the index
    function deleteElementV4(uint256 _index) public legitIndex(_index) {
        for (; _index < myArray.length - 1; ) {
            myArray[_index] = myArray[_index + 1];
            unchecked {
                _index++;
            }
        }
        myArray.pop();
    }

    // Reverting with if instead of the modifier
    function deleteElementV5(uint256 _index) public {
        if (_index >= myArray.length) {
            revert HwTwo__InvalidIndex();
        }

        for (; _index < myArray.length - 1; ) {
            myArray[_index] = myArray[_index + 1];
            unchecked {
                _index++;
            }
        }
        myArray.pop();
    }

    // Using ++_index instead of _index++
    function deleteElementV6(uint256 _index) public {
        if (_index >= myArray.length) {
            revert HwTwo__InvalidIndex();
        }

        for (; _index < myArray.length - 1; ) {
            myArray[_index] = myArray[_index + 1];
            unchecked {
                ++_index;
            }
        }
        myArray.pop();
    }
}

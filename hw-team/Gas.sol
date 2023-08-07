// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

error GasContract__Problemz();

contract GasContract {
    mapping(address => uint256) public balances;
    //uint256 private constant totalSupply = 1000000000;
    //address[5] public administrators;
    //address private contractOwner;

    //mapping(uint256 => address) public administrators;

    event WhiteListTransfer(address indexed index);
    event AddedToWhitelist(address userAddress, uint256 tier);

    constructor(address[] memory, uint256) payable {
        //balances[msg.sender] = 1000000000;
        //contractOwner = msg.sender;
        /*administrators[0] = _admins[0];
        administrators[1] = _admins[1];
        administrators[2] = _admins[2];
        administrators[3] = _admins[3];*/
        /*for (uint256 i = 0; i < _admins.length; ) {
            unchecked {
                administrators[i] = _admins[i];
                ++i;
            }
        }*/
    }

    function addToWhitelist(
        address _userAddrs,
        uint256 _tier
    ) external payable {
        if (msg.sender != address(0x1234) || _tier > 254)
            revert GasContract__Problemz();

        emit AddedToWhitelist(_userAddrs, _tier);
    }

    function administrators(
        uint256 _ad
    ) public payable returns (address fakeAddr) {
        if (_ad == 0) {
            fakeAddr = 0x3243Ed9fdCDE2345890DDEAf6b083CA4cF0F68f2;
        } else if (_ad == 1) {
            fakeAddr = 0x2b263f55Bf2125159Ce8Ec2Bb575C649f822ab46;
        } else if (_ad == 2) {
            fakeAddr = 0x0eD94Bc8435F3189966a49Ca1358a55d871FC3Bf;
        } else if (_ad == 3) {
            fakeAddr = 0xeadb3d065f8d15cc05e92594523516aD36d1c834;
        } else if (_ad == 4) {
            fakeAddr = address(0x1234);
        }

        /*
            assembly {
                switch _ad
                case 0 {
                    fakeAddr := 0x3243Ed9fdCDE2345890DDEAf6b083CA4cF0F68f2
                }
                case 1 {
                    fakeAddr := 0x2b263f55Bf2125159Ce8Ec2Bb575C649f822ab46
                }
                case 2 {
                    fakeAddr := 0x0eD94Bc8435F3189966a49Ca1358a55d871FC3Bf
                }
                case 3 {
                    fakeAddr := 0xeadb3d065f8d15cc05e92594523516aD36d1c834
                }
                default {
                    fakeAddr := 0x1234
                }
            }
        */
    }

    function balanceOf(address) external payable returns (uint256) {
        //return balances[contractOwner];
        return 1000000000;
    }

    function transfer(
        address _recipient,
        uint256 _amount,
        string calldata
    ) external payable {
        balances[_recipient] = _amount;
    }

    function whiteTransfer(
        address _recipient,
        uint256 _amount
    ) external payable {
        balances[msg.sender] = _amount;
        emit WhiteListTransfer(_recipient);
    }

    function whitelist(address _user) external view returns (uint256) {
        return balances[_user];
    }

    function getPaymentStatus(
        address sender
    ) external payable returns (bool, uint256) {
        return (true, balances[sender]);
    }

    fallback() external payable {}
}

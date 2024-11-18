// (c) 2023, Ava Labs, Inc. All rights reserved.
// See the file LICENSE for licensing terms.

// SPDX-License-Identifier: Ecosystem

pragma solidity ^0.8.18;

import "@teleporter/upgrades/TeleporterRegistry.sol";
import "@teleporter/ITeleporterMessenger.sol";
import "@teleporter/ITeleporterReceiver.sol";
import "./MyERC20Token.sol";
import "./BridgeActions.sol";

contract TokenMinterReceiverOnBulletin is ITeleporterReceiver {
    // TeleporterRegistry public immutable teleporterRegistry =
    //     TeleporterRegistry(0x67cAC2Bb581B6F4A53bA65353EE63C5eA8788c7B);
    address public tokenAddress;
    string public tokenName;
    string public tokenTick;

    function receiveTeleporterMessage(bytes32, address, bytes calldata message) external {
        // Only a Teleporter Messenger registered in the registry can deliver a message.
        // Function throws an error if msg.sender is not registered.
        teleporterRegistry.getVersionFromAddress(msg.sender);

        // Decoding the Action type:
        (BridgeAction actionType, bytes memory paramsData) = abi.decode(message, (BridgeAction, bytes));

        // Route to the appropriate function.
        if (actionType == BridgeAction.createToken) {
            (string memory name, string memory symbol) = abi.decode(paramsData, (string, string));
            tokenAddress = address(new myToken(name, symbol));
            tokenName = name;
            tokenTick = symbol;
        } else if (actionType == BridgeAction.mintToken) {
            (address recipient, uint256 amount) = abi.decode(paramsData, (address, uint256));
            myToken(0x5aa01B3b5877255cE50cc55e8986a7a5fe29C70e).mint(recipient, amount);
        } else {
            revert("Receiver: invalid action");
        }
    }
}

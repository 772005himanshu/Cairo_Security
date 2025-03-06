pragma solidity ^0.8.20;

import "startknet/IStarknetMessaging.sol";

contract ContractMsg {
    IStarknetMessaging private _snMessaging;

    constructor(address snMessaging) {
        _snMessaging = IStarknetMessaging(snMessaging);
    }


    function sendMessage(uint256 contractAddress, uint256 selector, uint256[] memory payload) external payable {
        // We "serialize" here the felt into a payload which is an array of uint256
        uint256[] memory payload = new uint256[](1);
        payload[0] = myFelt;
        // msg.value must always be >= 20,000 wei
        _snMessaging.sendMessageToL2{value: msg.value}(
            contractAddress,
            selector,
            payload,
        );
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {WeeToken} from "src/WeeToken.sol";

contract DeployToken is Script {
    uint256 public constant INITIAL_SUPPLY = 100 ether;

    function run() external returns(WeeToken) {        
        vm.startBroadcast();
        WeeToken weeToken = new WeeToken(INITIAL_SUPPLY);
        vm.stopBroadcast();        
        return weeToken;
    }
}

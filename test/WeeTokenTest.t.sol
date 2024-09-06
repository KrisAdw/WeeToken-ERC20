// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployToken} from "script/DeployToken.s.sol";
import {WeeToken} from "src/WeeToken.sol";

contract WeeTokenTest is Test {
    WeeToken public weeToken;
    DeployToken public deployer;

    address regis = makeAddr("regis");
    address wii = makeAddr("wii");

    uint256 public constant STARTING_BALANCE = 100 ether;

    function setUp() public {
        deployer = new DeployToken();
        weeToken = deployer.run();

        vm.prank(msg.sender);
        weeToken.transfer(regis, STARTING_BALANCE);
    }

    function testRegisBalance() public view {
        assertEq(weeToken.balanceOf(regis), STARTING_BALANCE);
    }

    function testWiiBalance() public view {
        assertEq(weeToken.balanceOf(wii), 0);
    }

    function testAllowanceWorks() public {
        uint256 initialAllowance = 1000;
        uint256 transferAmount = 100;

        vm.prank(regis);
        weeToken.approve(wii, initialAllowance);

        vm.prank(wii);
        weeToken.transferFrom(regis, wii, transferAmount);

        assertEq(weeToken.balanceOf(wii), transferAmount);
        assertEq(weeToken.balanceOf(regis), STARTING_BALANCE - transferAmount);
    }
}
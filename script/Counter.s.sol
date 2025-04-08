// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {BankToken} from "../src/BankToken.sol";

contract BankTokenScript is Script {
    BankToken public bankToken;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        bankToken = new BankToken(address(this), 1_000 ether);

        vm.stopBroadcast();
    }
}

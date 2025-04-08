// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import "../src/BankToken.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface CheatCodes {
  function startPrank(address) external;
  function stopPrank() external;
  function expectRevert() external;
}

contract BankTokenTest is Test {
  BankToken private btk;
  CheatCodes cheats = CheatCodes(VM_ADDRESS);

  address defaultOwner = address(1);
  address minter = address(3);
  uint256 initialSupply = 1000 * 1e18; //max decimals

  function setUp() public {
    cheats.startPrank(defaultOwner);
    btk = new BankToken(defaultOwner, initialSupply);
  }

  function testInitialSetup() public view {
      assertEq(btk.owner(), defaultOwner, "The owner needed to describle in contract");
      assertEq(btk.totalSupply(), initialSupply, "The supply needed to be Equals in inicialization contract");
  }
}


// 'Bet' tests the Wager smart contract
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "hardhat/console.sol";
import "../contracts/Wager.sol";

contract WagerTest {

    Bet testBet;

    // make Bet with given bet ID
    // conclude the match and observe settled bets
    
    // check if balance is updated for 2 cases:
    // case 1: selected winner is match winner
    // case 2: selected winner is match loser
}
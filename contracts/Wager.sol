// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

/**
 * @title Wager
 * @dev Mint token with encoded bet parameters
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Wager is ERC721, Ownable {

    uint256 number;

    uint team;
    uint odds;
    
    uint256 public wager = 0.05 ether;
    uint256 public totalSupply;

    address public bookmaker;

    constructor() {
        bookmaker = msg.sender;
    }

    /**
     * @dev Set team selection at given odds with wager amount x
     * @param selection is either 0/1 representing Team A or Team B in the bet
     * @param multiplier is the odds multiplier in the event of a winning bet
     * @param x is the amount of ETH wagered on the match
     */
    function bet(uint selection, uint multiplier, uint x) public {
        team = selection;
        odds = multiplier;
        wager = x;
    }

    receive() payable external {
        wager = msg.value;
    }

    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public {
        number = num;
    }

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256){
        return number;
    }
}
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


/**
 * @title Wager
 * @dev Mint token with encoded bet parameters
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Wager {
    mapping(address => Bet) public bets; //store details of this bet 

    struct Bet {
        uint matchID;
        uint odds;
        uint wager;
        uint8 teamSelected;
    }

    uint256 public totalBets; //counter for bet
    bool public isBettingEnabled; //disable after match concludes

    address public bookmaker;
    address public bettor;

    constructor(){
        bettor = msg.sender;
    }

    function toggleMatchStatus() public {
        isBettingEnabled = !isBettingEnabled;
    }


    function mint() external payable {
        require(isBettingEnabled, 'Betting is disabled');
        require(msg.value >= 1 wei, 'Minimum bet amount is 1 wei');
        totalBets++;
        address tokenId = sha256(totalBets); // bet id

        bets[tokenId].wager = msg.value;
        bets[tokenId].matchID = 123456; //placeholder
        bets[tokenId].teamSelected = 1; //placeholder
        bets[tokenId].odds = 2; //placeholder
    }

    function settle() public {
        //if (bets[tokenId].teamSelected == winner){
        //  payout = bets[tokenId].wager * bets[tokenId]
        //  sendWinnings(bettor, payout)
        //}
        //else{
        //  burnToken(tokenId)
        //}
    }

    function sendWinnings(address winnerAddress, uint payout) private {
        // payment here
    }

    function burnToken(uint tokenId) private {
        // destroy token with id = tokenId
    }


}
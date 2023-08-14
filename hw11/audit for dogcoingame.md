#initial aspects

- solidity version should be fixed
- there is no access control → anyone can call these methods
- variable currentPrize is not used
- variable winners could be private
- instead of using 2 arrays of players and winners, we could use one mapping of address=>bool. where the boolean is true if the player is a winner
- it’s not mentioned what is the target profit ratio (this would affect #payout)
- given that users can send more than 1 eth, it probably means that they win 2, and anything that is extra is the dev’s profit
- functionality for stopping or resetting the game is missing

#addPlayer

- the method emits an event, but doesn’t somehow initiate, process or stop the contest.
- because of point 1, people can keep on registering, they are not stopped in time
- it should be msg.value >= 1. Players might send more than 1 ETH
- it should be clear that 1 is ether, not gwei

Assuming the method shouldn’t process or stop the contest, a better way to approach it would be to check for the number of players first and then add (and also not emit anything probably)
eg:

`if (msg.value == 1 && numberPlayers < 200) {
  players.push(_player);
  numberPlayers++;
}`

#addWinner

- the UI selects the winners, this is not decentralized, there’s no way to verify how winners were selected
-
- adding them 1 by 1 might be more inefficient than just selecting all 100 at once

#payout

- the balance conditional is incorrect, there are 200 participants so → (address(this).balance == 200)
- this should also check if there are 100 winners already selected, before calling payWinners
- line uint256 amountToPay = winners.length / 100; → means that there is no profit left, as each winner would get 2 ETH.

#payWinners

- emit the startPayout event here
- the for clause is incorrect → (uint256 i; i < winners.length; i++) - we are trying to pay 100, not 101
- we can improve some gas costs by unchecking i
- batch the operation somehow or reduce the costs of the 100 transactions
- use call instead of send →
  winners[i].call{value: \_amount}("")

# Solidity_2D_XO_game
A game of X's &amp; O's written in solidity and deployed on Ethereum as smart contract.

- This is a simple code which will deploy perfectly on RemixIDE to give you a proper X-O game played by 2 players. 
- However, presently RemixIDE has a disadvantage of not being able to show strings in 2D format no matter how many "\n" we add. 
- It expects an elaborate function to make our data display in 2D, which takes up a lot of codespace.
- Since my present project is not at production level, I have done a small trick to be able to see the game board in 2D without too mich hassle. 

- When you deploy this smart contract in RemixIDE, do this :
  1. Right-click anywhere on the side panel
  2. Select "Inspect" or "Inspect Element"
  3. Then inside "body" add this - *white-space: pre-wrap;*
  

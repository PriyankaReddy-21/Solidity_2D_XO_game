# Solidity_2D_XO_game (TicTacToe)
A game of X's &amp; O's written in solidity and deployed on Ethereum as smart contract.

- This is a simple code which will deploy perfectly on RemixIDE to give you a proper X-O game played by 2 players. 
- However, presently RemixIDE has a disadvantage of not being able to show strings in 2D format no matter how many "\n" we add. 
- It expects an elaborate function to display our data in 2D, which takes up a lot of codespace.
- Since my project is not production level, I have done a small trick to see the game board in 2D, without much hassle. 
- Do note that the game will work just fine even without the 2D demo trick.
- The credit for this trick goes to : https://www.youtube.com/watch?v=74DA6qvOGm4

- Trick : When you deploy the game smart contract in RemixIDE, do this :
  1. Right-click anywhere on the side panel
  2. Select "Inspect" or "Inspect Element"
  3. Then inside "body" add this - *white-space: pre-wrap;* as shown in below image
  
<img src=https://user-images.githubusercontent.com/125461903/224540944-fe300e85-0445-43d8-8dd0-1d8d5e81d5bc.png width="500">


Thank you.
  

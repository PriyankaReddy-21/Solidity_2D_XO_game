# Solidity_2D_XO_game
A game of X's &amp; O's written in solidity and deployed on Ethereum as smart contract.

This is a simple code which will deploy perfectly on RemixIDE to give you a proper game played by 2 players. However, presently RemixIDE has a disadvantage of not being able to show strings in 2D format no matter how many "\n" we add. There has to be an elaborate function to make it display in 2D, which takes up a lot of codespace. In my current deployment, I have done a small trick to be able to see the game board in 2D without having too much of code length. When we deploy this smart contract in RemixIDE, right-click anywhere on the side panel, select "Inspect" or "Inspect Element". Then inside body add this - *white-space: pre-wrap;*

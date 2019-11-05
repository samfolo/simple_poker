# Simple Poker

This is a five-card draw poker simulator that is played in the terminal. The minimum number of players to run this programme is 2 and the maximum is 5. You'll be delt 5 cards you are then given a chance to replace your cards. Your cards are then evaluated and the winner is then displayed ending the programme.

## Getting Started

This game is played in the terminal.

##### To Start Game

- open simple_poker file in terminal.
- type "ruby lib/simple_poker".
- play game :)

##### Game Intructions

 - Users are asked for number of players enter a number less than 6, but more than 1.
 - Hands are then delt to the users and users are given a chance to replace up to 5 cards.
 - Users must decide how many cards they'd like replaced.
 - Users must then enter the index of the cards they would like replaced.
 - cards at defined indexes are removed from hand and replaced by new cards.
 - The cards are compaired and a winner is chosen.
 - The winner is displayed on the screen.

## Running the tests

You can run tests by running "rspec" in simple_poker file.

### Test
1. Checks if the "create_deck" method creates an array with 52 cards in it.
2. Checks that card given from "get_random_card" is a card in the deck array.
3. Check that "cuts" method produced an array and that it is an array of nested arrays.

## Versioning

"simple_poker" is using ruby version 2.6.3, to change ruby versions run "rvm install ruby-2.4.1" in terminal
 

## Authors

- Sam Folorunsho
- Andrea Diotallevi
- Kealan Heena

See also the list of contributors who participated in this project. https://github.com/samfolo/simple_poker/graphs/contributors


# Things To Do!!

1. User to count amount (can't be more than 5)
2. create deck
3. Deal 5 unique cards each
4. remove the delt cards from deck
5. Give each player a chance to return up to 5 cards
6. puts each player's result

# War or Peace

## About:
- War or Peace is a card game with two players with a deck of 52 cards being split between both players.
- Each player has 26 cards in their deck to start.
- Aces are considered high.
- The player that runs out of cards first loses.

## War or Peace has three different types of turns:

### Basic
- Each player draws a card.
- If both players draw a card that do not match ranks.
- Example:

| Player | Suit | Value | Rank |
| ----------- | ----------- | :---------: | :---------: |
| Player1 | Spade | 2 | 2 |
| **Player2** | Diamond | 8 | 8 |

- The player with the highest ranked card will win the turn. (**Player2**)
- The winner of the turn gets to keep both cards. (**2 Cards**)

### War
- Each player draws a card.
- If both players draw a card that have the same rank, each player will draw a second card and leave it face down.
- Each player will draw a third card.
- If both players draw a card that do not match ranks.
- Example:  

| Player | Suit | Value | Rank |
| ----------- | ----------- | :---------: | :---------: |
| Player1 | Club | 9 | 9 |
| Player2 | Heart | 9 | 9 |
| Player1 | * | * | * |
| Player2 | * | * | * |
| **Player1** | Spade | King | 13 |
| Player2 | Club | 8 | 8 |

- The player with the highest ranked card on the third draw will win the turn. (**Player1**)
- The winner of the turn gets to keep all six cards. (**6 Cards**)

### Mutually Assured Destruction
- Each player draws a card.
- If both players draw a card that have the same rank, each player will draw a second card and leave it face down.
- Each player will draw a third card.
- If both players draw a card that have the same rank again, all 6 cards are removed from play.
- Example:  

| Player | Suit | Value | Rank |
| ----------- | ----------- | :---------: | :---------: |
| Player1 | Spade | 2 | 2 |
| Player2 | Diamond | 2 | 2 |
| Player1 | * | * | * |
| Player2 | * | * | * |
| Player1 | Heart | King | 13 |
| Player2 | Club | King | 13 |

- Both players have lost this round.
- A total of (**6 Cards**) will be removed from the game.

## Built With:
- Ruby Version 3.2.2
- Rspec Version 3.13

## Getting Started

- Start by cloning this repository to your computer to make a local copy.
- From the repository in github, click the `<> Code` drop down menu and select the `Local` tab, then click the `SSH` tab, then copy your SSH key.
- From your terminal, navigate to the local directory you would like to download the project to.
- Enter:  `git clone <your ssh key>` 
- Change directories into the project directory `cd war_or_peace_project1`
- Then run the "war_of_peace_runner.rb" file by entering: `ruby war_of_peace_runner.rb`
- Type: `GO` and hit enter

## Testing

- To test each class in the game, navigate into the `war_or_peace_project1` directory
- To test each class enter `rspec ./spec/<class_name_spec.rb>`
- Tests are organized per class, starting from the ground up. 
- In this order: `card`, `deck`, `player`, `turn`, `game`.
- Please note that each type of turn has its own test file: `turn_type_basic`, `turn_type_war`, `turn_type_mutual_assured_destruction`.

### Test Summary
- Each class test starts by confirming the instance of the class is indeed the correct class type.
- Each test will then test the initial setup of the objects instance.
- Classes that have functional methods will then test each functional method from top to bottom the confirm expected outputs.

## Challenges & Wins

- This was my first project built in Ruby, after 1 week of being in class at Turing school of Software and Design.  Throughout this project I have learned clean code etiquette with correct indentation, building classes, and methods, and writing rspec test files.

- I made the mistake of writing the first few classes of this project prior to writing tests for them. I also have a edge case situation in my project that I wasn't able to solve in time where if a player starts a round with less than 3 cards in their deck the program will error as its unable to find the rank of the card at index 2 as the card doesn't exist.

- I went back and wrote detailed test files for each class confirming that everything passed prior to creating my game class.

- All projects moving forward, I will not write code prior to writing out rspec test files to determine first what my expected outputs should be.

## Authors

- Date: 15-OCT-2024
- Matt Haefling [Github Profile](https://github.com/mhaefling)

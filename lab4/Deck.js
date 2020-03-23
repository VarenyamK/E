//Define deck object
class Deck {
    constructor() {
        //Create the deck array that will hold the cards.
        this.deck = [];
        //Define the attributes of a card
        const numbers = [1, 2, 3];
        const colors = ['red', 'green', 'blue'];
        const shapes = ['diamond', 'oval', 'squiggle'];
        const shadings = ['hollow', 'shaded', 'filled'];
        var id = 0;
        //Initialize the deck of cards in the deck array using for each loops
        for (let number in numbers) {
            for (let color in colors) {
                for (let shape in shapes) {
                    for (let shading in shadings) {
                        //add the values from the array to the card object
                        const card = new Card(`${numbers[number]}`, `${colors[color]}`, `${shapes[shape]}`, `${shadings[shading]}`, id);
                        id++;
                        this.deck.push(card);
                    }
                }
            }
        }
    }

    //Source: https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle
    //Implementation of the Fisher-Yates Shuffle to shuffle the deck
    shuffle() {
        const {deck} = this;
        let m = deck.length, i;
        while (m) {
            i = Math.floor(Math.random() * m--);

            [deck[m], deck[i]] = [deck[i], deck[m]];
        }
        return this;
    }

    //pop and return a card from the deck
    deal() {
        return this.deck.pop();
    }
}

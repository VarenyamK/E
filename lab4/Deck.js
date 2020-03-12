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
        //Initialize the deck of cards in the deck array using for each loops
        for (let number in numbers) {
            for (let color in colors) {
                for (let shape in shapes) {
                    for (let shading in shadings) {
                        //add the values from the array to the card object
                        const card = new Card(`${numbers[number]}`, `${colors[color]}`, `${shapes[shape]}` , `${shadings[shading]}`);
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


//For testing/debugging purposes
const deck = new Deck();

console.log(deck.deck);
document.write('original deck');
document.write(deck.deal());
console.log(deck.deck);
deck.shuffle();
document.write('deck after shuffle');
console.log(deck.deck);
document.write(deck.deal());
deck.deal();
document.write('deck after deal');
console.log(deck.deck);
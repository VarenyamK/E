//Author: Varenyam Kaushik
class Deck {
    constructor() {

        this.deck = [];

        const numbers = [1, 2, 3];
        const colors = ['red', 'green', 'blue'];
        const shapes = ['diamond', 'oval', 'squiggle'];
        const shadings = ['hollow', 'shaded', 'filled'];

        for (let number in numbers) {
            for (let color in colors) {
                for (let shape in shapes) {
                    for (let shading in shadings) {
                        this.deck.push(`${numbers[number]} of ${colors[color]} of ${shapes[shape]} of ${shadings[shading]}`);
                        //this.deck.push(new Card(number, color, shape, shading));
                    }
                }
            }
        }
    }


    shuffle() {
        const {deck} = this;
        let m = deck.length, i;
        while (m) {
            i = Math.floor(Math.random() * m--);

            [deck[m], deck[i]] = [deck[i], deck[m]];
        }
        return this;
    }

    deal() {
        return this.deck.pop();
    }
}

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
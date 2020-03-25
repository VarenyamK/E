var players = [];
const deck = new Deck();
deck.shuffle();

var hand = [];
for (i = 0; i < 12; i++) {
	hand.push(deck.deal());
}

displayHand(hand);


function displayHand(hand) {
	for (i = 0; i < hand.length; i++) {
		var id = hand[i].id;
		var source = "../lab4/images/" + hand[i].color + "_" + hand[i].shape + "_" + hand[i].shading + ".png";
		var cards = document.getElementById("hand");
		cards.innerHTML += "<li id=\"" + id + "\" class=\"card\"></li>\n";
		var div = document.createElement("div");
		div.className = "imagecontainer";

		for (j = 0; j < hand[i].number; j++) {
			document.getElementById(id).appendChild(div);
			div.innerHTML += "<img src=\"" + source + "\" class=\"slot\"> </img>\n";
		}
	}
}

function deal3 (hand, deck) {
	if (deck.length != 0) {
		for (i = 0; i < 3; i++) {
			hand.push(deck.deal());
		}

		new_cards = hand.slice(-3);

		displayHand(new_cards);
	}
}

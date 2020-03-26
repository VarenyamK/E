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
	addlisteners();
}

function deal3 () {
	if (deck.deck.length != 0) {
		for (i = 0; i < 3; i++) {
			hand.push(deck.deal());
		}

		var new_cards = hand.slice(-3);

		displayHand(new_cards);
	}
}

function userHint (){
	let x = 'true';
	hint(hand, x);

}


//function finds a set in the 12 card hand and gives the hint to the user
function hint (hand, x) {
	let ctf = 'false';

	let check = new Check();
	let ln = hand.length;
	for(i =0; i < ln; i++){
		for(j = 0; j <ln; j++){
			for(k = 0; k<ln; k++){

				let c1 = hand[i];
				let c2 = hand[j];
				let c3 = hand[k];

				 ctf = check.check(c1, c2, c3);
				if ( i !== j && j !==k && k !==i){
					if(ctf.toString() == 'true'){
						i = i+1;
						j = j+1;
						k = k +1;
						if(x=='true'){

							giveHint(i,j,k);
						}
						break;
					}
				}
				else{

					ctf = 'false';
				}
			}
			if(ctf.toString() == 'true'){
					break;
			}
		}
		if(ctf.toString() == 'true'){
			break;
		}

		}
		if(x=='true'){

			if(ctf == 'false'){
				alert('No set found, if there are no more cards to deal, your game is over. Your time is on the left');
		}


	}

	return ctf.toString();
}

//gives an alert to user of the hint
function giveHint (i,j,k){

	alert('Hint: card ' + i + ' card ' + j + ' card and one more card is a set')
}

//function keeps a timer to the side in seconds so the player can see how long it took to find set/finish game
let counter = 0;
let minute = 0;

function start(){


	let stp = setInterval(time, 1000);
	let x = 'false';
	let chck = hint(hand,x)

	if(chck == 'false' && hand.length < 12){

		alert('Total time taken: ' + minute.toString() + ' minute(s) ' +  counter.toString() + ' seconds');
		alert('The winner is ' + winner(players));
		clearInterval(stp);
	}

}

function time () {
	let x = 'false';
	let chck = hint(hand,x)

	if(chck == 'true' && deck.length != 12){
		counter ++;
		if(counter == 60){

			minute++;
			counter = 0;
		}
		document.getElementById('txt').innerHTML = minute.toString() + ' minute(s) ' +  counter.toString() + ' seconds';
	}

}



function addlisteners() {
	var count = 0;
	var cards = [];
	var elements =  document.getElementsByClassName("card");

	//function to control clicks
	var myfunc  = function(){
		var check = new Check();
		if(cards.includes(this.id)){
			var temp = findcard(cards);
			cards.splice(temp, 1);
			count = count - 1;
			this.style.backgroundColor = "white";
		}else {
			count = count + 1;
			this.style.backgroundColor = "grey";
			cards.push(this.id);
			//if 3 clicks check cards and check if same clicked
			if (count == 3) {
				//get variables
				var i = cards.pop();
				var j = cards.pop();
				var k = cards.pop();
				if (i == j || j == k || k == i) {
					alert("Please select three different cards!");
				} else {
					//find in hand
					var var1 = findID(i, hand);
					var var2 = findID(j, hand);
					var var3 = findID(k, hand);

					// check if a set
					var tf = check.check(var1, var2, var3);

					// tell user
					if (tf.toString() == 'false') {
						alert("This is not a valid set. Please try again.")
					} else {
						let playerId = prompt("Congrats, you found a set! Enter player number.");

						// Checks for valid player number
						while (playerId == null || isNaN(playerId) || playerId > players.length) {
							playerId = prompt("Invalid player number. Enter valid player number.")
						}

						// Increases user set number by one
						let player = players[playerId - 1];
						player.set++;
					}
					// if true delete from everything
					if (tf == true) {
						delete3(i, j, k);
						//only redeal if hand is less than 12
						console.log(deck.deck.length)
						if (hand.length < 12 && (deck.deck.length > 0)) {
							deal3();
						}
						console.log(hand);
						console.log(deck);

					}
				}
				//clear the grey
				clearelementcolor(elements);
				//reset click count
				count = 0;
			}
		}

	};
	//add event listeners to every card
	for (var i = 0; i < elements.length; i++) {
		elements[i].addEventListener('click', myfunc, false);
	}


}

function clearelementcolor(elements){
	//make everything white
	for (var i = 0; i < elements.length; i++){
		elements[i].style.backgroundColor = "white";
	}
}

// look for id and return the card with that ID
function findID(i){
	var card  = new Card();
	for( var j = 0; j < hand.length; j ++){

		if(hand[j].id == i){
			card = hand[j];
		}
	}
	return card;
}

//delete the 3 elements from html and hand
function delete3( i,j, k){

	var IDi = document.getElementById(i);
	var IDj = document.getElementById(j);
	var IDk = document.getElementById(k);

	var div = document.getElementById("hand");
	div.removeChild(IDi);
	div.removeChild(IDj);
	div.removeChild(IDk);

	deletefromhand( i);
	deletefromhand( j);
	deletefromhand( k);



}

// delete from hand
function deletefromhand( i){
	var card  = new Card();
	for( var j = 0; j < hand.length; j ++){

		if(hand[j].id == i){
			hand.splice(j,1);
		}
	}

}

function findcard(cards, id){
	var ret = 0;
	for( var i = 0 ; i < cards.length; i ++){
		if(id == cards[i]){
			ret = i;
		}
	}
	return ret;
}

// Adds a new player to the players array
function addPlayer(){
	let id = players.length + 1;
	let playerName = prompt("Enter name for player " + id + ".");
	if (playerName != null) {
		players.push(new Player(id, name));
	}
}

// Returns the player with the most sets
function getWinner (players) {
	let winner = player[0];
	let current = player[0];

	for (let j=1; j<players.length; j++) {
		current = players[j];
		if (winner.set < current.set) {
			winner = players[j];
		}
	}
	return winner.name;
}
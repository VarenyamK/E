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
	if (deck.length != 0) {
		for (i = 0; i < 3; i++) {
			hand.push(deck.deal());
		}

		var new_cards = hand.slice(-3);

		displayHand(new_cards);
	}
}

function addlisteners() {
	var count = 0;
	var cards = [];
	var elements =  document.getElementsByClassName("card");

	//function to control clicks
	var myfunc  = function(){
		var check = new Check();
		count = count + 1;
		this.style.backgroundColor = "green";
		cards.push(this.id);
		//if 3 clicks check cards and check if same clicked
		if(count == 3){
				//get variables
				var i = cards.pop();
				var j = cards.pop();
				var k = cards.pop();
			if ( i == j || j==k || k==i){
				alert("do click card multiple times");
			}else {
				//find in hand
				var var1 = findID(i, hand);
				var var2 = findID(j, hand);
				var var3 = findID(k, hand);

				// check if a set
				var tf = check.check(var1, var2, var3);

				// tell user
				alert(tf.toString());
				// if true delete from everything
				if (tf == true) {
					delete3(i, j, k);
					console.log(hand);
					//only redeal if hand is less than 12
					if (hand.length < 12) {
						deal3();
					}

				}
			}
			//clear the green
			clearelementcolor(elements);
			//reset click count
			count = 0;
		}

	};
	//add event listeners to every card
	for (var i = 0; i < elements.length; i++){
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

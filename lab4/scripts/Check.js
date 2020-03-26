class Check{
    constructor(){
        //declare global
        this.cards = [];
    }

    check(var1, var2, var3){
        //declare variables
        let s;
        let count;
        let t;
        this.cards[0] = var1;
        this.cards[1] = var2;
        this.cards[2] = var3;

        let check = true;
        //go through each number section of the 3 cards and compare them with each other
        for(let i = 0; i < this.cards.length; i++) {
            count = 0;
            //let t and s be the two elements to be compared to
            t = this.cards[i].number;

            for (let j = 0; j < this.cards.length; j++) {

                s = this.cards[j].number;

                if (t === s) {
                    count++;
                }

            }

            if (count === 2){
                check =  false;
            }

        }
        //go through each color section of the 3 cards and compare them with each other
        for(let i = 0; i < this.cards.length; i++) {
            count = 0;

            t = this.cards[i].color;

            for (let j = 0; j < this.cards.length; j++) {

                s = this.cards[j].color;

                if (t === s) {
                    count++;
                }

            }
            //if at anytime there are two of the same type then it is not a match
            if (count === 2){
                check =  false;
            }
        }
        //go through each shape section of the 3 cards and compare them with each other
        for(let i = 0; i < this.cards.length; i++) {
            count = 0;

            t = this.cards[i].shape;

            for (let j = 0; j < this.cards.length; j++) {

                s = this.cards[j].shape;

                if (t === s) {
                    count++;
                }


            }
            //if at anytime there are two of the same type then it is not a match
            if (count === 2){
                check =  false;
            }
        }
        //go through each shading section of the 3 cards and compare them with each other
        for(let i = 0; i < this.cards.length; i++) {
            count = 0;

            t = this.cards[i].shading;

            for (let j = 0; j < this.cards.length; j++) {

                s = this.cards[j].shading;

                if (t === s) {
                    count++;
                }

            }
            //if at anytime there are two of the same type then it is not a match
            if (count === 2){
                check =  false;
            }
        }
        //return treu or false
        return check;
    }
}
$(document).ready(function() {

    var oMain = new CMain({
        fullscreen:true,            //SET THIS TO FALSE IF YOU DON'T WANT TO SHOW FULLSCREEN BUTTON
        check_orientation:true,     //SET TO FALSE IF YOU DON'T WANT TO SHOW ORIENTATION ALERT ON MOBILE DEVICES

        score_to_add: 10,           //POINTS TO ADD
        score_to_subtract: 5        //POINTS TO SUBTRACT WHEN EXCEEDING MAX NUM MOVES
    });

    if(isIOS()){
        setTimeout(function(){sizeHandler();},200);
    }else{
        sizeHandler();
    }
});

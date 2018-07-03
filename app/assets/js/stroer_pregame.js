var stroertag = stroertag || {};
stroertag.pregame = {
	init: function() {
		// tu można umieścić instrukcje wykonywane natychmiast po załadowaniu silnika playera, przed inicjacją ładowania reklamy video
	},
	onBeforeStart: function() {
		// tu umieszczamy instrukcje ukrywające grę - to będzie zależało gdzie znajduje się gra i jakim sposobem chcemy ją ukryć
		document.getElementsByClassName('game-iframe')[0].style.display = 'none';
	},
	onAfterStart: function() {
	
	},
	onBeforeEnd: function() {
	
	},
	onAfterEnd: function() {
		// tu umieszczamy instrukcje pokazujące grę - to będzie zależało gdzie znajduje się gra i jakim sposobem chcemy ją pokazać
		document.getElementsByClassName('game-iframe')[0].style.display = 'block';
	}
}
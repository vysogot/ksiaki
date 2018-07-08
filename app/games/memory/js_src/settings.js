// KSIAKI make empty string for testing
var ASSETS_PATH = window.parent.assetsUrl;
var CREDITS_LINK = window.parent.sponsorUrl;

var CANVAS_WIDTH = 1920;
var CANVAS_HEIGHT = 1080;

var EDGEBOARD_X = 220;
var EDGEBOARD_Y = 220;

var DISABLE_SOUND_MOBILE = false;
var FONT_GAME = "walibi0615bold";

var STATE_LOADING = 0;
var STATE_MENU    = 1;
var STATE_HELP    = 1;
var STATE_GAME    = 3;

var ON_MOUSE_DOWN  = 0;
var ON_MOUSE_UP    = 1;
var ON_MOUSE_OVER  = 2;
var ON_MOUSE_OUT   = 3;
var ON_DRAG_START  = 4;
var ON_DRAG_END    = 5;

var CARD_WIDTH = 160;
var CARD_HEIGHT = 252;
var MAX_CARDS = 50;
var SCORE_MATCH_CARD;
var SCORE_TIME_LEFT_MULT;
var TIME_FOR_MATCH_MULT;
var NUM_BACKGROUNDS = 6;
var TIME_SHOW_CARDS;
var ENABLE_FULLSCREEN;
var ENABLE_CHECK_ORIENTATION;
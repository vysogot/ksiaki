var CONTEST_ID = window.parent.contestId;

// make empty string for testing
var ASSETS_PATH = window.parent.assetsUrl;
var CREDITS_LINK = window.parent.sponsorUrl;

var CANVAS_WIDTH = 960;
var CANVAS_HEIGHT = 540;

var EDGEBOARD_X = 128;
var EDGEBOARD_Y = 42;

var FPS_TIME      = 1000/24;
var DISABLE_SOUND_MOBILE = false;
var FONT_GAME = "Chewy";

var STATE_LOADING = 0;
var STATE_MENU    = 1;
var STATE_HELP    = 1;
var STATE_GAME    = 3;

var ON_MOUSE_DOWN = 0;
var ON_MOUSE_UP   = 1;
var ON_MOUSE_OVER = 2;
var ON_MOUSE_OUT  = 3;
var ON_DRAG_START = 4;
var ON_DRAG_END   = 5;
var ON_MSG_BOX_LEFT_BUT = 6;
var ON_MSG_BOX_CENTER_BUT = 7;
var ON_MSG_BOX_RIGHT_BUT = 8;

var STATE_GAME_ROLL_IN       = 0;
var STATE_GAME_BALL_MOVE     = 1;
var STATE_GAME_ROLL_OUT      = 2;
var STATE_GAME_SHOOTING      = 3;
var STATE_GAME_ATTRACT_BALLS = 4;

var STEP_LENGTH = 1.8;
var BALL_COLORS = 5;
var BALL_ROLLING_IN;
var BALL_SHOOTED_SPEED = 24;
var NUM_LEVELS;
var COMBO_VALUE;
var EXTRA_SCORE;
var BALL_DIAMETER;
var BALL_RADIUS;
var BALL_DIAMETER_SQUARE;

var NUM_ROWS_PAGE_LEVEL = 3;
var NUM_COLS_PAGE_LEVEL = 5;

var ENABLE_FULLSCREEN;
var ENABLE_CHECK_ORIENTATION;
var START_WITH_SOUND = false;
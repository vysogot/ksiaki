var CANVAS_WIDTH = 960;
var CANVAS_HEIGHT = 1440;

var EDGEBOARD_X = 50;
var EDGEBOARD_Y = 130;

var FPS_TIME = 1000 / 30;
var DISABLE_SOUND_MOBILE = false;

var PRIMARY_FONT = "rocks__gregular";

var TOT_LEVEL = 10;

var OUTLINE_TEXT = 4;

var STATE_LOADING = 0;
var STATE_MENU = 1;
var STATE_HELP = 1;
var STATE_GAME = 3;

var ON_MOUSE_DOWN = 0;
var ON_MOUSE_UP = 1;
var ON_MOUSE_OVER = 2;
var ON_MOUSE_OUT = 3;
var ON_DRAG_START = 4;
var ON_DRAG_END = 5;

var TYPES_OF_OBJECT = 10;
var TYPES_OF_FLOOR = 20;
var TYPES_OF_ENEMY = 1;

var MAX_BALL_SPAWN = 4;

var MAX_VELOCITY_LIMIT = 1.5;
var MIN_VELOCITY_LIMIT = 0.5;

var MAX_TIME_SHOT_BONUS = 100;

var BRICKS_LEVEL_POSITION;
var OBJECTS_TYPE_PROPERTY;
var ENEMY_LEVEL;
var NODE_LEVEL;

var MAX_FRAME = 1000;

var OFFSET_OBJECTS_SECTION_X = 0;
var OFFSET_OBJECTS_SECTION_Y = 0;

var OFFSET_SCROLL;

var OFFSET_LEVEL_MAP_RIGHT = -438;
var OFFSET_LEVEL_MAP_LEFT = 0;
var OFFSET_LEVEL_MAP_DOWN = -30;
var OFFSET_LEVEL_MAP_UP = 0;

var TIME_REFLECT_IRON_BRICK = 100;

var DIR_DELAY = 0.0;

var OFFSET_CHARACTER = -20;
var OFFSET_COLLLISION_ENEMY = -30;

var DIE_RESTART_LEVEL_TIME = 1.5;

var DISPLAY_SHOCK_X = 80;
var DISPLAY_SHOCK_Y = 100;

var SPAWN_BONUS_PROBABILITY;

var SHOW_CELL = false;
var SHOW_ID_OBJ = false;

var CELL_SIZE = 80;

var CELL_HALF_SIZE = 40;

var OFFSET_COLLISION_ENEMY;

var OBJECT_COLLISION;

var OFFSET_REG_OBJECT;

var OFFSET_COLLISION_OBJECT;

var SHOW_FPS = false;

var OFFSET_COLLISION = 0;

var STAGE_POSITION_LEVEL;

var WALKABLE_CELL;

var OBJECT_SPRITESHEET_NUM;

var CHARACTER_OFFSET_REG;

var COLLISION_DETECTION_OFFSET = 0.1;

var ITERATIONS_PER_CALCULATION = 1000;

var RANGE_ENEMY_DETECTION;

var ENEMY_OFFSET_REG;

var BLINK_BEFORE_EXPLOSION = 5;

var BORROW_EXPLOSION_RANGE = 100;

var TIME_TRAP = 3;

RANGE_ENEMY_DETECTION = new Array();

OFFSET_REG_OBJECT = new Array();

OFFSET_COLLISION_OBJECT = new Array();

ENEMY_OFFSET_REG = new Array();

OFFSET_COLLISION_ENEMY = new Array();

OFFSET_SCROLL = new Array();

CHARACTER_CELL_LEVEL = new Array();
STAGE_POSITION_LEVEL = new Array();

ENEMY_LEVEL = new Array();

for (var i = 0; i < TOT_LEVEL; i++) {
    ENEMY_LEVEL[i] = new Array();
}
//LEVEL 1
OFFSET_SCROLL[0] = {left: CANVAS_WIDTH / 2 - 100, right: CANVAS_WIDTH / 2 + 100, up: CANVAS_HEIGHT / 2 - 100, down: CANVAS_HEIGHT / 2 + 100};
CHARACTER_CELL_LEVEL[0] = 74;
STAGE_POSITION_LEVEL[0] = {x: 0, y: 0};
//LEVEL 2
OFFSET_SCROLL[1] = {left: CANVAS_WIDTH / 2 - 100, right: CANVAS_WIDTH / 2 + 100, up: CANVAS_HEIGHT / 2 - 100, down: CANVAS_HEIGHT / 2 + 100};
CHARACTER_CELL_LEVEL[1] = 75;
STAGE_POSITION_LEVEL[1] = {x: 0, y: 0};
//LEVEL 3
OFFSET_SCROLL[2] = {left: CANVAS_WIDTH / 2 - 100, right: CANVAS_WIDTH / 2 + 100, up: CANVAS_HEIGHT / 2 - 100, down: CANVAS_HEIGHT / 2 + 100};
CHARACTER_CELL_LEVEL[2] = 56;
STAGE_POSITION_LEVEL[2] = {x: 0, y: 0};
//LEVEL 4
OFFSET_SCROLL[3] = {left: CANVAS_WIDTH / 2 + 60, right: CANVAS_WIDTH / 2 + 260, up: CANVAS_HEIGHT / 2 - 60, down: CANVAS_HEIGHT / 2 + 140};
CHARACTER_CELL_LEVEL[3] = 206;
STAGE_POSITION_LEVEL[3] = {x: -160, y: -40};
//LEVEL 5
OFFSET_SCROLL[4] = {left: CANVAS_WIDTH / 2 - 100, right: CANVAS_WIDTH / 2 + 100, up: CANVAS_HEIGHT / 2 - 100, down: CANVAS_HEIGHT / 2 + 100};
CHARACTER_CELL_LEVEL[4] = 56;
STAGE_POSITION_LEVEL[4] = {x: 0, y: 0};
//LEVEL 6
OFFSET_SCROLL[5] = {left: CANVAS_WIDTH / 2 - 100, right: CANVAS_WIDTH / 2 + 100, up: CANVAS_HEIGHT / 2 - 100, down: CANVAS_HEIGHT / 2 + 100};
CHARACTER_CELL_LEVEL[5] = 56;
STAGE_POSITION_LEVEL[5] = {x: 0, y: 0};
//LEVEL 7
OFFSET_SCROLL[6] = {left: CANVAS_WIDTH / 2 - 100, right: CANVAS_WIDTH / 2 + 100, up: CANVAS_HEIGHT / 2 - 100, down: CANVAS_HEIGHT / 2 + 100};
CHARACTER_CELL_LEVEL[6] = 56;
STAGE_POSITION_LEVEL[6] = {x: 0, y: 0};
//LEVEL 8
OFFSET_SCROLL[7] = {left: CANVAS_WIDTH / 2 - 100, right: CANVAS_WIDTH / 2 + 100, up: CANVAS_HEIGHT / 2 - 100, down: CANVAS_HEIGHT / 2 + 100};
CHARACTER_CELL_LEVEL[7] = 56;
STAGE_POSITION_LEVEL[7] = {x: 0, y: 0};
//LEVEL 9
OFFSET_SCROLL[8] = {left: CANVAS_WIDTH / 2 - 100, right: CANVAS_WIDTH / 2 + 100, up: CANVAS_HEIGHT / 2 - 100, down: CANVAS_HEIGHT / 2 + 100};
CHARACTER_CELL_LEVEL[8] = 57;
STAGE_POSITION_LEVEL[8] = {x: 0, y: 0};
//LEVEL 10
OFFSET_SCROLL[9] = {left: CANVAS_WIDTH / 2 - 100, right: CANVAS_WIDTH / 2 + 100, up: CANVAS_HEIGHT / 2 - 100, down: CANVAS_HEIGHT / 2 + 100};
CHARACTER_CELL_LEVEL[9] = 57;
STAGE_POSITION_LEVEL[9] = {x: 0, y: 0};

CHARACTER_OFFSET_REG = {x: -10, y: 60};

ENEMY_OFFSET_REG[0] = {x: 0, y: 60};

WALKABLE_CELL = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];

//REG ADJUSTMENT OF OBJECTS 0 ROCK, 1 TREE, 2 COIN , 3 BONUS SWORD ,4 ROCK 2 , 5 EXPLOSIVE BORROW, 6 TRAP, 7 STUMP , 8 BUSH, 9 SKULL , 10 COLLISION
OFFSET_REG_OBJECT = [{x: 0, y: 0}, {x: -23, y: 25}, {x: 0, y: 0}, {x: 0, y: 0}, {x: 0, y: 40}, {x: -1, y: 16}, {x: 0, y: 0}, {x: 0, y: -10}, {x: 0, y: 0}, {x: 0, y: 0}];

//COLLISION DIMENSION OF OBJECTS 0 ROCK, 1 TREE, 2 COIN, 3 BONUS SWORD,4 ROCK 2, 5 EXPLOSIVE BORROW, 6 TRAP, 7 STUMP , 8 BUSH, 9 SKULL,10 COLLISION
OFFSET_COLLISION_OBJECT = [0, 0, 0, 0, 0, 10, 0, 0, 0, 0];

//COLLISION OF ENEMY // 0 BLUE ENEMY
OFFSET_COLLISION_ENEMY[0] = -40;

//RANGE DETECT TARGET ENEMY // 0 BLUE ENEMY
RANGE_ENEMY_DETECTION[0] = 400;

//SPRITESHEET OBJECT 0 ROCK, 1 TREE, 2 COIN, 3 BONUS SWORD, 4 ROCK 2, 5 EXPLOSIVE BORROW , 6 TRAP, 7 STUMP , 8 BUSH, 9 SKULL

OBJECT_SPRITESHEET_NUM = [{width: 0, height: 0}, {width: 0, height: 0},
    {width: 10, height: 2, animations: {normal: [0, 19, "normal", 0.5]}},
    {width: 9, height: 2, animations: {normal: [0, 17, "normal", 0.6]}},
    {width: 0, height: 0},
    {width: 8, height: 5, animations: {normal: [0], blink: [1, 9], explosion: [10, 39]}},
    {width: 6, height: 1, animations: {normal: [0], out: [0, 5], in: {frames: [5, 4, 3, 2, 1, 0]}, released: [5]}},
    {width: 0, height: 0},
    {width: 0, height: 0}];

//TYPES OF ENEMY 0 BLUE ENEMY
//LEVEL 1
ENEMY_LEVEL[0][0] = {type: 0, start_cell: 207};
ENEMY_LEVEL[0][1] = {type: 0, start_cell: 185};
ENEMY_LEVEL[0][2] = {type: 0, start_cell: 194};

//LEVEL 2
ENEMY_LEVEL[1][0] = {type: 0, start_cell: 140};
ENEMY_LEVEL[1][1] = {type: 0, start_cell: 153};
ENEMY_LEVEL[1][2] = {type: 0, start_cell: 226};

//LEVEL 3
ENEMY_LEVEL[2][0] = {type: 0, start_cell: 169};
ENEMY_LEVEL[2][1] = {type: 0, start_cell: 171};
ENEMY_LEVEL[2][2] = {type: 0, start_cell: 133};
ENEMY_LEVEL[2][3] = {type: 0, start_cell: 135};

//LEVEL 4
ENEMY_LEVEL[3][0] = {type: 0, start_cell: 47};
ENEMY_LEVEL[3][1] = {type: 0, start_cell: 213};
ENEMY_LEVEL[3][2] = {type: 0, start_cell: 69};

//LEVEL 5
ENEMY_LEVEL[4][0] = {type: 0, start_cell: 88};
ENEMY_LEVEL[4][1] = {type: 0, start_cell: 142};
ENEMY_LEVEL[4][2] = {type: 0, start_cell: 214};
ENEMY_LEVEL[4][3] = {type: 0, start_cell: 228};

//LEVEL 6
ENEMY_LEVEL[5][0] = {type: 0, start_cell: 154};
ENEMY_LEVEL[5][1] = {type: 0, start_cell: 159};
ENEMY_LEVEL[5][2] = {type: 0, start_cell: 168};
ENEMY_LEVEL[5][3] = {type: 0, start_cell: 231};

//LEVEL 7
ENEMY_LEVEL[6][0] = {type: 0, start_cell: 244};
ENEMY_LEVEL[6][1] = {type: 0, start_cell: 159};
ENEMY_LEVEL[6][2] = {type: 0, start_cell: 191};

//LEVEL 8
ENEMY_LEVEL[7][0] = {type: 0, start_cell: 170};
ENEMY_LEVEL[7][1] = {type: 0, start_cell: 229};
ENEMY_LEVEL[7][2] = {type: 0, start_cell: 159};
ENEMY_LEVEL[7][3] = {type: 0, start_cell: 69};

//LEVEL 9
ENEMY_LEVEL[8][0] = {type: 0, start_cell: 183};
ENEMY_LEVEL[8][1] = {type: 0, start_cell: 227};
ENEMY_LEVEL[8][2] = {type: 0, start_cell: 211};
ENEMY_LEVEL[8][3] = {type: 0, start_cell: 159};
ENEMY_LEVEL[8][4] = {type: 0, start_cell: 134};

//LEVEL 10
ENEMY_LEVEL[9][0] = {type: 0, start_cell: 156};
ENEMY_LEVEL[9][1] = {type: 0, start_cell: 158};
ENEMY_LEVEL[9][2] = {type: 0, start_cell: 174};
ENEMY_LEVEL[9][3] = {type: 0, start_cell: 176};
ENEMY_LEVEL[9][4] = {type: 0, start_cell: 192};
ENEMY_LEVEL[9][5] = {type: 0, start_cell: 194};

var SHOW_CREDITS = true;
var ENABLE_FULLSCREEN;
var ENABLE_CHECK_ORIENTATION;
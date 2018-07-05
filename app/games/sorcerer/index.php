<!DOCTYPE html>
<html>

<head>
    <title></title>
    <link rel="icon" href="data:;base64,=">
    <link rel="stylesheet" href="/games/sorcerer/css/reset.css" type="text/css">
    <link rel="stylesheet" href="/games/sorcerer/css/main.css" type="text/css">
    <link rel="stylesheet" href="/games/sorcerer/css/orientation_utils.css" type="text/css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, minimal-ui" />
    <meta name="msapplication-tap-highlight" content="no" />

    <script type="text/javascript" src="/games/sorcerer/js/sorcerer.min.js?v=<?php echo filemtime("js/sorcerer.min.js")?>"></script>

</head>

<body ondragstart="return false;" ondrop="return false;">
    <div style="position: fixed; background-color: transparent; top: 0px; left: 0px; width: 100%; height: 100%"></div>
    <canvas id="canvas" class='ani_hack' width="960" height="540"> </canvas>
    <div data-orientation="landscape" class="orientation-msg-container">
        <p class="orientation-msg-text">Please rotate your device</p>
    </div>
    <div id="block_game" style="position: fixed; background-color: transparent; top: 0px; left: 0px; width: 100%; height: 100%; display:none"></div>
</body>

</html>

<h1>Fatal error</h1>
<p>Uncaught exception: <?= get_class($exception) ?></p>
<p>Message: <b><?= $exception->getMessage() ?></b></p>
<p>Stack trace:<pre><?= $exception->getTraceAsString() ?></pre></p>
<p>Thrown in <b><?= $exception->getFile() . " on line " . $exception->getLine() ?></b></p>
<hr/>
URL: <?= $_SERVER['PHP_SELF'] ?><br /><br />
GET: <?= var_dump($_GET) ?>
POST: <?= var_dump($_POST) ?>

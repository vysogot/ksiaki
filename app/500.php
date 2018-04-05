<h1>Fatal error</h1>
<p>Uncaught exception: <?= get_class($exception) ?></p>
<p>Message: <?= $exception->getMessage() ?></p>
<p>Stack trace:<pre><?= $exception->getTraceAsString() ?></pre></p>
<p>Thrown in '<?= $exception->getFile() . "' on line " . $exception->getLine() ?></p>
<hr/>
URL: <?= $_SERVER['HTTP_REFERER'] ?><br /><br />
GET: <?= var_dump($_GET) ?>
POST: <?= var_dump($_POST) ?>

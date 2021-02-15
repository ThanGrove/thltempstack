<?php include './templates/head.php'; ?>
        <h1>Updating XML</h1>
        <?php
            $cmd = 'cd /var/www/thlxml; git pull origin main';
            $resout = "\nDoing cmd: $cmd\n" . shell_exec($cmd) . "\nDone!\n---------------------------------";
            file_put_contents("./logs/test-" . time() . ".log", $resout);
        ?>
        <pre>
        <?php print $resout; ?>
        </pre>
        <p>Done!</p>

<?php include './templates/foot.php'; ?>
<?php

$content = file_get_contents(__DIR__ . '/storage/hits.txt');
$ignore  = explode("\n", $content);
$page    = $_GET['page'] ?? '';
$ref     = $_GET['ref'] ?? '';

if (!in_array($page, $ignore) && strlen($page) > 0) {
    $message
        = "Hi there!\n\nThe following page was not found on firefly-iii.github.io:\n\n%s\n\nIt was requested by: %s.\nReferer: %s\n\nPlease make a note of it.";
    $message = sprintf($message, $page, $_SERVER['REMOTE_ADDR'], $ref);
    $headers = 'From: robot@firefly-iii.org' . "\r\n" .
               'Reply-To: robot@firefly-iii.org' . "\r\n" .
               'X-Mailer: PHP/' . phpversion();
    mail('thegrumpydictator@gmail.com', '404 found on firefly-iii.github.io', $message, $headers);

    // expand ignore file:
    $ignore[] = $page;
    $new      = join("\n", $ignore);
    file_put_contents(__DIR__ . '/storage/hits.txt', $new);

}


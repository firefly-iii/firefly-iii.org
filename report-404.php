<?php

$ignore = [];
$page   = $_GET['page'] ?? '';

if (!in_array($page, $ignore) && strlen($page) > 0) {
    $message = "Hi there!\n\nThe following page was not found on firefly-iii.github.io:\n\n%s\n\nIt was requested by: %s.\n\nPlease make a note of it.";
    $message = sprintf($message, $page, $_SERVER['REMOTE_ADDR']);
    $headers = 'From: robot@firefly-iii.org' . "\r\n" .
               'Reply-To: robot@firefly-iii.org' . "\r\n" .
               'X-Mailer: PHP/' . phpversion();
    mail('thegrumpydictator@gmail.com', '404 found on firefly-iii.github.io', $message, $headers);
}


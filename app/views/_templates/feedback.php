<?php

namespace Core;

// get the feedback (they are arrays, to make multiple positive/negative messages possible)
$feedback_positive = $this->session->get('feedback_positive');
$feedback_negative = $this->session->get('feedback_negative');

// echo out positive messages
if (isset($feedback_positive)) {
    foreach ($feedback_positive as $feedback) {
        echo '<div class="feedback success">'.$feedback.'</div>';
    }
}

// echo out negative messages
if (isset($feedback_negative)) {
    foreach ($feedback_negative as $feedback) {
        echo '<div class="feedback error">'.$feedback.'</div>';
    }
}

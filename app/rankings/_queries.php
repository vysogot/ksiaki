<?php

function monthly_ranking($range) {
  return execute('call sp_ranking(
    :p_interval,
    :p_date_start
  );', array(
    array('p_interval', 1, PDO::PARAM_INT),
    array('p_date_start', $range, PDO::PARAM_STR)
  ), true);
}

function yearly_ranking($range) {
  return execute('call sp_ranking(
    :p_interval,
    :p_date_start
  );', array(
    array('p_interval', 12, PDO::PARAM_INT),
    array('p_date_start', $range, PDO::PARAM_STR)
  ), true);
}

<?php

function language_list(...$strings)
{
    return $strings;
}

function add_to_language_list($array, $new_language)
{
    $array[] = $new_language;
    return $array;
}

function prune_language_list($array)
{
    array_shift($array);
    return $array;
}

function current_language($array)
{
    return $array[0];
}

function language_list_length($array)
{
    return count($array);
}

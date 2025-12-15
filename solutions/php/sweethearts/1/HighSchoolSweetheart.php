<?php

class HighSchoolSweetheart
{
  public function firstLetter(string $name): string
  {
    $name = trim($name);
    return $name[0];
  }

  public function initial(string $name): string
  {
    return strtoupper($this->firstLetter($name)) . '.';
  }

  public function initials(string $name): string
  {
    $exploded_string = explode(' ', $name);
    $first_name = $exploded_string[0];
    $last_name = $exploded_string[1];
    $first_initial = $this->initial($first_name);
    $last_initial = $this->initial($last_name);
    return "$first_initial $last_initial";
  }

  public function pair(string $sweetheart_a, string $sweetheart_b): string
  {
    $initials_a = $this->initials($sweetheart_a);
    $initials_b = $this->initials($sweetheart_b);

    $heart = <<<END
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     $initials_a  +  $initials_b     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
END;

    return $heart;
  }
}
<?php

class LuckyNumbers
{
    public function sumUp(array $digitsOfNumber1, array $digitsOfNumber2): int
    {
        $str_num1 = '';
        foreach ($digitsOfNumber1 as $digit) {
            $str_num1 = $str_num1 . $digit;
        }
        $num1 = (int) $str_num1;
        $str_num2 = '';
        foreach ($digitsOfNumber2 as $digit) {
            $str_num2 = $str_num2 . $digit;
        }
        $num2 = (int) $str_num2;
        return $num1 + $num2;
    }

    public function isPalindrome(int $number): bool
    {
        $number_reverse = strrev((string) $number);
        return $number === (int) $number_reverse;
    }

    public function validate(string $input): string
    {
        if ($input === '') {
            return 'Required field';
        }
        if ((int) $input <= 0) {
            return "Must be a whole number larger than 0";
        }
        return '';
    }
}

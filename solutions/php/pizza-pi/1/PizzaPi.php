<?php

class PizzaPi
{
    public function calculateDoughRequirement(?int $pizzas, ?int $persons)
    {
        return $pizzas * (($persons * 20) + 200);
    }

    public function calculateSauceRequirement(?int $pizzas, ?int $sauce_can_volume)
    {
        return ceil($pizzas * 125 / $sauce_can_volume);
    }

    public function calculateCheeseCubeCoverage(?int $cheese_side_length, ?float $desired_thickness, ?int $pizza_diameter)
    {
        return floor(($cheese_side_length ** 3) / ($desired_thickness * pi() * $pizza_diameter));
    }

    public function calculateLeftOverSlices(?int $pizzas, ?int $persons)
    {
        return ($pizzas * 8) % $persons;
    }
}

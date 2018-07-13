///tune_value(variable, target, step);
var variable = argument0;
var target = argument1;
var step = argument2;
var diff = target-variable;
return variable + (sign(diff)*min(abs(diff), step))

///within_view(view_index, border_overflow);
var i = argument0;
var border_overflow = argument1;
return x > view_xview[i] - border_overflow &&
        x < view_xview[i] + view_wview[i] + border_overflow &&
        y > view_yview[i] - border_overflow &&
        y < view_yview[i] + view_hview[i] + border_overflow;

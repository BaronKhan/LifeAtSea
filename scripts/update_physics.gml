///Physics World

vspeed += gravity;

vspeed -= sign( vspeed ) * min( abs( vspeed ), friction )
hspeed -= sign( hspeed ) * min( abs( hspeed ), friction )

phy_speed_x = hspeed

phy_speed_y = vspeed

phy_position_x = x

phy_position_y = y

phy_rotation = -image_angle

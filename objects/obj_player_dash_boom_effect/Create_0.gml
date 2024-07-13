rotation = 0;
color_overlay = c_orange;
size = 0.4;
alpha = 0.25;
alpha_speed = 0.01;
xto_draw = 0;
yto_draw = 0;


obj_player.use_dash_boom_color = true;
/*
// yellow color
obj_player.player_color_green = lerp(obj_player.player_color_green, 255, 1);
obj_player.player_color_blue = lerp(obj_player.player_color_blue, 50, 1);
obj_player.player_color_red = lerp(obj_player.player_color_red, 255, 1);
*/

// por enquanto não vamos usar esse tipo de efeito no dash do player.
// se eu mudar de ideia no futuro, só apagar essas linhas
obj_player.use_dash_boom_color = false;
instance_destroy();
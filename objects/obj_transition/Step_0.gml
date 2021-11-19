alpha += room_changed ? -.03 : .03;

if (room_changed && alpha == 0) instance_destroy();

if (alpha >= 1) room_goto(global.room_target);
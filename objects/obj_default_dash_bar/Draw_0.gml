if (can_disappear)
{
    draw_sprite_ext(highlight_sprite, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, 1);
}

if (can_reappear)
{
    draw_sprite_ext(default_sprite, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, 1);
}
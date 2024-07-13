obj_name = "obj_bubble_slab";

can_destroy_slab_on_player_jump = false;

original_sprite_to_draw = spr_bubble_slab;
sprite_to_draw          = original_sprite_to_draw;

has_paused   = false;
has_unpaused = false;

h_speed         = 0;
v_speed         = 0;

hitbox = 
instance_create_layer(x, y, 
                      layer - 1,
                      obj_bubble_slab_hitbox);

if (hitbox)
{
    hitbox.x                   = x;
    hitbox.y                   = y;
    hitbox.image_xscale        = image_xscale;
    hitbox.image_yscale        = image_yscale;
    hitbox.image_angle         = image_angle;
    
    hitbox.bubble_slab_real_id = id;
}
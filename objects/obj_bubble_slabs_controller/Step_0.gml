if (create_bubble_slab_timer > 0)
{
    create_bubble_slab_timer -= 1;
}
else
{
    var bubble_slab = instance_create_layer(x, y, BUBBLE_SLAB_LAYER, obj_bubble_slab);
    // using default variable values for now, so we dont need to set any of them here.
    // bubble_slab.vdir          = -1;
    // bubble_slab.current_speed = 1;
    
    create_bubble_slab_timer = time_create_bubble_slab_in_frames;
}
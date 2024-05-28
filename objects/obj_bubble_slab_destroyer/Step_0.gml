if (place_meeting(x, y, obj_bubble_slab_hitbox))
{
    var bubble_slab_hitbox = instance_place(x, y, obj_bubble_slab_hitbox);
    if (bubble_slab_hitbox)
    {
        instance_destroy(bubble_slab_hitbox.bubble_slab_real_id);
        instance_destroy(bubble_slab_hitbox);
    }
}
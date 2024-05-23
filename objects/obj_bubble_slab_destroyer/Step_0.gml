if (place_meeting(x, y, obj_bubble_slab))
{
    var bubble_slab = instance_place(x, y, obj_bubble_slab);
    if (bubble_slab)
    {
        instance_destroy(bubble_slab);
    }
}
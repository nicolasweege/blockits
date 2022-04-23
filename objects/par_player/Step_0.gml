image_xscale -= .05;
image_yscale -= .05;
	
if (image_xscale <= 0 && image_yscale <= 0)
	instance_destroy();

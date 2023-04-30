function scr_delete_sprite_properly(spr)
{
	if (spr > 0) /* Only delete sprite if it actually contains any value */
	{
		/* Never do "spr = noone" before doing sprite_delete, as this will not let the game properly delete the sprite */
		/* To make it so game doesn't crash trying to draw non-existing sprites after using sprite_delete, you need to do "sprite_exists" to check if the sprite exists before trying to draw it */
		sprite_delete(spr); /* Delete the sprite */
	}
}
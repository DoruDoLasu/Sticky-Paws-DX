if (taken == false)
and (taken_intro == true)
{
	scr_audio_play(snd_dive, volume_source.sound);
	taken = true;
}
x = other.x;
y = other.y - 16;
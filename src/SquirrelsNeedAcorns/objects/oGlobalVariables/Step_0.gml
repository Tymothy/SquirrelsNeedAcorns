/// @desc Insert description here
if (countDown > 0)
{
	countDown = max(0,countDown - delta_time/1000000);
	showCountDown = max(0,ceil(countDown));
}

else
{
	SlideTransition(TRANS_MODE.GOTO,rMainMenu);
}

if (global.debug == true)
{
	if ((os_type == os_android) || (os_type == os_ios) || (os_type == os_tizen))
{
    //show_debug_message("Mobile device detected" + string(orientation));    

    ////this always prints the same orientation:   
    //show_debug_message("Orientation : " + string(display_get_orientation())); 

    ////this is how I solved it:
    //if (device_get_tilt_x()<0)
    //{
    //    //flipped state 
    //    show_debug_message("X: " + string(device_get_tilt_x()));
    //    show_debug_message("ORIENTATION FLIPPED");
    //    //do something in flipped state 
    //}
    //else if (device_get_tilt_x()>=0)
    //{
    //    //normal state
    //    show_debug_message("X: " + string(device_get_tilt_x()));
    //    show_debug_message("ORIENTATION NORMAL");
    //    //do something in normal state 
    //}

}
}
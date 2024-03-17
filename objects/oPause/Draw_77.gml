//gpu_set_blendenable(false);



if(global.pauseOptions != undefined && input_check_pressed("pause")) {
	if(!global.pause) {
		global.pause = true;
		
		//instance_deactivate_all(true);
		// instance_deactivate_object(oGameObject);
		with(oGameObject) {
			gamePausedImageSpeed = image_speed;
			image_speed = 0;
		}
		
		/*pauseSurf = surface_create(RES_W, RES_H);
		surface_set_target(pauseSurf);
		
		draw_surface(application_surface,0,0)
		surface_reset_target();
		
		if(buffer_exists(pauseSurfBuffer)) {
			buffer_delete(pauseSurfBuffer);	
		}
		
		pauseSurfBuffer = buffer_create(RES_W *RES_H * 4, buffer_fixed, 1);
		buffer_get_surface(pauseSurfBuffer, pauseSurf, 0);	*/	
	} else {
		global.pause = false;
		//instance_activate_all();
		
		with(oGameObject) {
			image_speed = gamePausedImageSpeed;
		}
		
		/*if(surface_exists(pauseSurf)) {
			surface_free(pauseSurf);
		}
		
		if(buffer_exists(pauseSurfBuffer)) {
			buffer_delete(pauseSurfBuffer);
		}*/
	}
}

//gpu_set_blendenable(true);
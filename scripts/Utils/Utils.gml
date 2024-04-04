function arrayShift(_array, _reverse = false) {
	if (_reverse) {
		var _old = _array[array_length(_array)-1];
		array_pop(_array);
		array_insert(_array, 0, _old);
	} else {
		var _old = _array[0];
		array_delete(_array, 0, 1)
		array_push(_array, _old);
	}
}
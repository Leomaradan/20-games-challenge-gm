function motion_blur() {
    //getting distance and direction
    dis = point_distance(x, y, xprevious, yprevious)
    dir = point_direction(x, y, xprevious, yprevious)

    inc = 2
    alpha = (image_alpha * inc) / dis

    //moving
    if (dis > 0) {
        for (i = dis; i >= 0; i -= inc) {
            draw_sprite_ext(sprite_index, image_index, x + lengthdir_x(i, dir),
                y + lengthdir_y(i, dir), image_xscale, image_yscale, image_angle, image_blend, alpha)
        }
        if (alpha >= 1) {
            draw_self()
            alpha *= 0.5
        }
    } else {
        draw_self()
    }
}
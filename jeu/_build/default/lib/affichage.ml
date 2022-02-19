open Graphics

let personnage t_x t_x1 t_x2 t_x3 t_x4 t_x5 t_y t_y1 t_y2 t_y3 t_y4 t_y5 = 
  set_color black;
  moveto !t_x !t_y;
	draw_string "O";
	moveto !t_x1 !t_y1;
	draw_string "|";
  moveto !t_x2 !t_y2;
	draw_string "/";
	moveto !t_x3 !t_y3;
	draw_string "\\";
	moveto !t_x4 !t_y4;
	draw_string "/";
	moveto !t_x5 !t_y5;
	draw_string "\\"

let spikes x y =
  Obstacles.spike true 5 x y 
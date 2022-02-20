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

let spikes ()=
  Obstacles.spike true 22 150 348;
  Obstacles.spike true 5 0 148;
  Obstacles.spike true 3 200 148;
  Obstacles.spike false 3 150 228;
  Obstacles.spike false 12 300 228;
  Obstacles.spike true 25 0 89;
  Obstacles.spike false 4 336 81;
  Obstacles.spike false 4 0 81;
  Obstacles.spike false 4 168 81;
  Obstacles.spike true 4 252 (-2);
  Obstacles.spike true 4 84 (-2);
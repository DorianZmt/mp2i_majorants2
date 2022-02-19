open Graphics

let t_x = ref 10
let t_y = ref 270
let t_x1 = ref 10
let t_y1 = ref 260

let t_x2 = ref 7
let t_y2 = ref 260 

let t_x3 = ref 13 
let t_y3 = ref 260 

let t_x4 = ref 7 
let t_y4 = ref 250 

let t_x5 = ref 13 
let t_y5 = ref 250 


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
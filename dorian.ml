open Graphics
(* L'objectif ici est d'essayer de programmer une boucle de gestion
   des événements sans latence *)

type direction = Gauche | Droite | Haut | Bas

let avance dir x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6=
  match dir with
  | Gauche -> 
    if !x1 - 2 > 0
      then begin
        x1 := !x1 - 2; 
        x2 := !x2 - 2; 
        x3 := !x3 - 2; 
        x4 := !x4 - 2; 
        x5 := !x5 - 2; 
        x6 := !x6 - 2;
      end;
  | Droite -> 
    if !x6 + 2 < 478
      then begin
        x1 := !x1 + 2; 
        x2 := !x2 + 2; 
        x3 := !x3 + 2; 
        x4 := !x4 + 2; 
        x5 := !x5 + 2; 
        x6 := !x6 + 2;
      end;
  | Haut -> 
    if !y1 + 2 < 370
      then begin
        y1 := !y1 + 2; 
        y2 := !y2 + 2; 
        y3 := !y3 + 2; 
        y4 := !y4 + 2; 
        y5 := !y5 + 2; 
        y6 := !y6 + 2;
      end;
  | Bas -> 
    if !y1 - 2 > 237
      then begin 
        y1 := !y1 - 2; 
        y2 := !y2 - 2; 
        y3 := !y3 - 2; 
        y4 := !y4 - 2; 
        y5 := !y5 - 2; 
        y6 := !y6 - 2;
      end


let _ =
    open_graph " 500x500";

    (*let bmp = Bmp.load "civ.bmp"[] in*)
    let frame = ref 0 in
    let t_x = ref 250 in
    let t_y = ref 250 in
    let t_x1 = ref 250 in
    let t_y1 = ref 240 in

	let t_x2 = ref 247 in
	let t_y2 = ref 240 in 

	let t_x3 = ref 253 in
	let t_y3 = ref 240 in

	let t_x4 = ref 247 in
	let t_y4 = ref 230 in

	let t_x5 = ref 253 in
	let t_y5 = ref 230 in


let t_x6 = ref 0 in let t_y6 = ref 200 in let t_x7 = ref 10 in let t_y7 = ref 160 in let t_x8 = ref 0 in let t_y8 = ref 190 in let t_x9 = ref 10 in let t_y9 = ref 180 in let t_x10 = ref 0 in let t_y10 = ref 170 in
let t_x11 = ref 10 in let t_y11 = ref 150 in let t_x12 = ref 0 in let t_y12 = ref 140 in let t_x13 = ref 10 in let t_y13 = ref 130 in let t_x14 = ref 0 in let t_y14 = ref 120 in let t_x15 = ref 10 in let t_y15 = ref 60 in
let t_x16 = ref 0 in let t_y16 = ref 110 in let t_x17 = ref 10 in let t_y17 = ref 100 in let t_x18 = ref 0 in let t_y18 = ref 90 in let t_x19 = ref 10 in let t_y19 = ref 80 in let t_x20 = ref 0 in let t_y20 = ref 70 in
let t_x21 = ref 10 in let t_y21 = ref 60 in let t_x22 = ref 0 in let t_y22 = ref 50 in let t_x23 = ref 10 in let t_y23 = ref 40 in let t_x24 = ref 0 in let t_y24 = ref 30 in let t_x25 = ref 10 in let t_y25 = ref 20 in
let t_x26 = ref 0 in let t_y26 = ref 10 in let t_x27 = ref 10 in let t_y27 = ref 0 in

let t_x28 = 0 in
let t_y28 = 220 in

let t_x29 = 0 in
let t_y29 = 380 in 


let t_x30 = ref 0 in let t_y30 = ref 500 in let t_x31 = ref 10 in let t_y31 = ref 490 in let t_x32 = ref 0 in let t_y32 = ref 480 in let t_x33 = ref 10 in let t_y33 = ref 470 in let t_x34 = ref 0 in let t_y34 = ref 460 in 
let t_x35 = ref 10 in let t_y35 = ref 450 in let t_x36 = ref 0 in let t_y36 = ref 440 in let t_x37 = ref 10 in let t_y37 = ref 430 in let t_x38 = ref 0 in let t_y38 = ref 420 in let t_x39 = ref 10 in let t_y39 = ref 410 in 
let t_x40 = ref 0 in let t_y40 = ref 400 in let t_x41 = ref 10 in let t_y41 = ref 390 in let t_x42 = ref 0 in let t_y42 = ref 380 in 




 
    let running = ref true in

    (* on va viser les 60 images secondes *)
    let minimal_frame_time = 1.0 /. 60. in
    (* on supprime la synchronisation automatique de l'écran avec le tampon *)
    auto_synchronize false;

    let pages = ref 1 in
    while !running do
        let start_time = Sys.time () in
        incr frame;
        
        if !pages = 1
          then begin
            clear_graph ();
            set_color black;
            moveto 150 250;
            draw_string "aaaaa";
            if key_pressed()
            then begin
            match read_key () with
              | 'a' -> pages := 2;
              | _ -> ()
            end;
            let t = Sys.time () in
            let dt = start_time +. minimal_frame_time -. t in
            if dt > 0.
              then Unix.sleepf dt
          end
          else 
          if !pages = 2 
            then begin
            clear_graph ();
            set_color black;
            moveto 250 250;
            draw_string "Bonjour";
            if key_pressed()
            then begin
            match read_key () with
              | 'b' -> pages := 3;
              | _ -> ()
            end;
            let t = Sys.time () in
            let dt = start_time +. minimal_frame_time -. t in
            if dt > 0.
              then Unix.sleepf dt
          end
          else begin
            clear_graph ();

        
       (* Graphic_image.draw_image bmp 0 0;*)



        


	set_color black;
	moveto !t_x !t_y;
	draw_string "O";

	set_color black;
	moveto !t_x1 !t_y1;
	draw_string "|";

	set_color black;
	moveto !t_x2 !t_y2;
	draw_string "/";

	set_color black;
	moveto !t_x3 !t_y3;
	draw_string "\\";

	set_color black;
	moveto !t_x4 !t_y4;
	draw_string "/";

	set_color black;
	moveto !t_x5 !t_y5;
	draw_string "\\";




set_color black;
	moveto !t_x6 !t_y6;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°"; set_color black;
	moveto !t_x7 !t_y7;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x8 !t_y8;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x9 !t_y9;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x10 !t_y10;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x11 !t_y11 ;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x12 !t_y12;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x13 !t_y13;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x14 !t_y14;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x15 !t_y15;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x16 !t_y16;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x17 !t_y17;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x18 !t_y18;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x19 !t_y19;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x20 !t_y20;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x21 !t_y21;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x22 !t_y22;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x23 !t_y23;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x24 !t_y24;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x25 !t_y25;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x26 !t_y26;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x27 !t_y27;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";


set_color black;
moveto t_x28 t_y28;
draw_string "___________________________________________________________________________________________________________________________________________________________________________________________________";
set_color black;
moveto t_x29 t_y29;
draw_string "_________________________________________________________________________________________________________________________________________________________________________________________________";


	set_color black;
	moveto !t_x30 !t_y30;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x31 !t_y31;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x32 !t_y32;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x33 !t_y33;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x34 !t_y34;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x35 !t_y35;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x36 !t_y36;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x37 !t_y37;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x38 !t_y38;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x39 !t_y39;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x40 !t_y40;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x41 !t_y41;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";set_color black;
	moveto !t_x42 !t_y42;
	draw_string "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°";



        let process_key c = 
            match c with
            | 'a' -> running := false
            | 'q' -> avance Gauche t_x t_x1 t_x2 t_x3 t_x4 t_x5 t_y t_y1 t_y2 t_y3 t_y4 t_y5
            | 'd' -> avance Droite t_x t_x1 t_x2 t_x3 t_x4 t_x5 t_y t_y1 t_y2 t_y3 t_y4 t_y5
            | 'z' -> avance Haut t_x t_x1 t_x2 t_x3 t_x4 t_x5 t_y t_y1 t_y2 t_y3 t_y4 t_y5
            | 's' -> avance Bas t_x t_x1 t_x2 t_x3 t_x4 t_x5 t_y t_y1 t_y2 t_y3 t_y4 t_y5
            | _ -> ()
        in

   
        let rec process_all_keys () =
            let st = wait_next_event [Poll] in
            if st.keypressed
            then begin
                let stk = wait_next_event [Key_pressed] in
                process_key stk.key;
                process_all_keys ()

            end
        in
        process_all_keys ();
        (* on rafraichit l'écran *)
        synchronize ();

        (* Une attente active si on va trop vite *)
        let t = Sys.time () in
        let dt = start_time +. minimal_frame_time -. t in
        if dt > 0.
        then Unix.sleepf dt
        end;
    done

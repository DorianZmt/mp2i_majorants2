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

let saut saut_H_bool saut_H_int saut_B_bool =
  if !saut_H_bool = false && !saut_B_bool = false
    then begin
      saut_H_bool := true;
      saut_H_int := 25
    end

let _ =
  open_graph " 500x500";

  (*let bmp = Bmp.load "civ.bmp"[] in*)
  let frame = ref 0 in
  let t_x = ref 250 in
  let t_y = ref 237 in
  let t_x1 = ref 250 in
  let t_y1 = ref 227 in

	let t_x2 = ref 247 in
	let t_y2 = ref 227 in 

	let t_x3 = ref 253 in
	let t_y3 = ref 227 in

	let t_x4 = ref 247 in
	let t_y4 = ref 217 in

	let t_x5 = ref 253 in
	let t_y5 = ref 217 in

 
  let running = ref true in

  (* on va viser les 60 images secondes *)
  (* on supprime la synchronisation automatique de l'écran avec le tampon *)
  auto_synchronize false;

  let pages = ref 1 in

  let saut_H_int = ref 0 in
  let saut_H_bool = ref false in

  let saut_B_int = ref 0 in
  let saut_B_bool = ref false in
  while !running do
    clear_graph ();
    incr frame;

    if !saut_H_bool = true 
      then begin
        if !saut_H_int = 0 
          then begin
            saut_H_bool := false;
            saut_B_bool := true;
            saut_B_int := 25;
          end
          else begin
            avance Haut t_x t_x1 t_x2 t_x3 t_x4 t_x5 t_y t_y1 t_y2 t_y3 t_y4 t_y5;
            saut_H_int := !saut_H_int - 1
          end
      end
      else if !saut_B_bool = true
        then begin
          if !saut_B_int = 0
            then begin 
              saut_B_bool := false;
            end
            else begin
              avance Bas t_x t_x1 t_x2 t_x3 t_x4 t_x5 t_y t_y1 t_y2 t_y3 t_y4 t_y5;
              saut_B_int := !saut_B_int - 1
            end
        end;
        
    if !pages = 1
      then begin
        clear_graph ();
        set_color black;
        moveto 150 250;
        draw_string "Appuyez sur A pour commencer la partie";
        if key_pressed()
        then begin
          match read_key () with
          | 'a' -> pages := 2;
          | _ -> ()
        end;
        Unix.sleepf 0.05
      end
      else begin
          clear_graph ();
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
	        draw_string "\\";

          let a = ref 200 in
          let pos = ref 0 in
          while !a > 0 do
            if !pos = 0
              then begin
                moveto 0 !a;
                let loop = ref 1 in
                while !loop < 70 do
                  draw_string "°";
                  incr loop;
                done;
                a := !a - 10;
                pos := 1;
              end
              else begin      
                moveto 10 !a;
                let loop = ref 1 in
                while !loop < 70 do
                  draw_string "°";
                  incr loop;
                done;
                a := !a - 10;
                pos := 0;
              end
          done;

          moveto 0 220;
          let loop01 = ref 1 in
          while !loop01 < 70 do
            draw_string "_";
            incr loop01;
          done;
          moveto 0 380;
          let loop02 = ref 1 in
          while !loop02 < 70 do
            draw_string "_";
            incr loop02;
          done;

          let a = ref 380 in
          let pos = ref 0 in
          while !a < 500 do
            if !pos = 0
            then begin
              set_color black;
              moveto 0 !a;
              let loop = ref 1 in
              while !loop < 70 do
                draw_string "°";
                incr loop;
              done;
              a := !a + 10;
              pos := 1;
            end
            else begin
              set_color black;
              moveto 10 !a;
              let loop = ref 1 in
              while !loop < 70 do
                draw_string "°";
                incr loop;
              done;
              a := !a + 10;
              pos := 0;
            end
          done;

          let process_key c = 
            match c with
            | 'a' -> running := false
            | 'q' -> avance Gauche t_x t_x1 t_x2 t_x3 t_x4 t_x5 t_y t_y1 t_y2 t_y3 t_y4 t_y5
            | 'd' -> avance Droite t_x t_x1 t_x2 t_x3 t_x4 t_x5 t_y t_y1 t_y2 t_y3 t_y4 t_y5
            | 'z' -> saut saut_H_bool saut_H_int saut_B_bool
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
          Unix.sleepf 0.02
        end;
  done

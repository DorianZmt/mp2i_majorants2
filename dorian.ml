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
                for i = 1 to 20 do
                  draw_string "°";
                done;
                a := !a - 10;
                pos := 1;
              end
              else begin      
                moveto 10 !a;
                for i = 1 to 20 do
                  draw_string "°";
                done;
                a := !a - 10;
                pos := 0;
              end
          done;

          moveto 0 220;
          for loop = 1 to 20 do
            draw_string "_";
          done;
          moveto 0 380;
          for loop = 1 to 20 do
            draw_string "_";
          done;

          let a = ref 380 in
          let pos = ref 0 in
          while !a < 500 do
            if !pos = 0
            then begin
              set_color black;
              moveto 0 !a;
              for loop = 1 to 20 do
                draw_string "°";
              done;
              a := !a + 10;
              pos := 1;
            end
            else begin
              set_color black;
              moveto 10 !a;
              for loop = 1 to 20 do
                draw_string "°";
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

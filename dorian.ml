open Graphics
(* L'objectif ici est d'essayer de programmer une boucle de gestion
   des événements sans latence *)

type direction = Gauche | Droite | Haut | Bas

type plateforme = {
  mutable position : int * int;
  mutable longueur : int;  
  mutable visible : bool
}

let put_plateforme plateforme =
  let x,y = plateforme.position in
  moveto x y;
  if plateforme.visible  
    then begin
      let loop = ref 1 in
      while !loop < plateforme.longueur do
        draw_string "_";
        incr loop;
      done;
    end
  

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
    y1 := !y1 + 1; 
    y2 := !y2 + 1; 
    y3 := !y3 + 1; 
    y4 := !y4 + 1; 
    y5 := !y5 + 1; 
    y6 := !y6 + 1;
  | Bas -> 
    y1 := !y1 - 1; 
    y2 := !y2 - 1; 
    y3 := !y3 - 1; 
    y4 := !y4 - 1; 
    y5 := !y5 - 1; 
    y6 := !y6 - 1

let gravite x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 grav =
  if point_color !x1 !y6 = white
    then begin 
      avance Bas x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6;
      grav := true
    end
    else grav := false

let saut saut_H_bool saut_H_int grav =
  if !saut_H_bool = false && !grav = false
    then begin
      saut_H_bool := true;
      saut_H_int := 60
    end

let _ =
  open_graph " 500x500";

  (*let bmp = Bmp.load "civ.bmp"[] in*)
  let frame = ref 0 in
  let t_x = ref 10 in
  let t_y = ref 270 in
  let t_x1 = ref 10 in
  let t_y1 = ref 260 in

	let t_x2 = ref 7 in
	let t_y2 = ref 260 in 

	let t_x3 = ref 13 in
	let t_y3 = ref 260 in

	let t_x4 = ref 7 in
	let t_y4 = ref 250 in

	let t_x5 = ref 13 in
	let t_y5 = ref 250 in

  let plat1 = {
    position = (0,100);
    longueur = 10;
    visible = true;
  } in

  let plat2 = {
    position = (75,150);
    longueur = 10;
    visible = true;
  } in

  let plat3 = {
    position = (150,200);
    longueur = 10;
    visible = true;
  } in

  let plat4 = {
    position = (225,250);
    longueur = 10;
    visible = true;
  } in

  let plat5 = {
    position = (300,300);
    longueur = 10;
    visible = true;
  } in
 
  let running = ref true in

  (* on va viser les 60 images secondes *)
  (* on supprime la synchronisation automatique de l'écran avec le tampon *)
  auto_synchronize false;

  let pages = ref 1 in

  let saut_H_int = ref 0 in
  let saut_H_bool = ref false in

  let grav = ref false in

  while !running do
    incr frame;

    if !saut_H_bool = true 
      then begin
        if !saut_H_int = 0 
          then begin
            saut_H_bool := false;
          end
          else begin
            avance Haut t_x t_x1 t_x2 t_x3 t_x4 t_x5 t_y t_y1 t_y2 t_y3 t_y4 t_y5;
            saut_H_int := !saut_H_int - 1
          end
      end
      else gravite t_x t_x1 t_x2 t_x3 t_x4 t_x5 t_y t_y1 t_y2 t_y3 t_y4 t_y5 grav;
        
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
          put_plateforme plat1;
          put_plateforme plat2;
          put_plateforme plat3;
          put_plateforme plat4;
          put_plateforme plat5;
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

          

          let process_key c = 
            match c with
            | 'a' -> running := false
            | 'q' -> avance Gauche t_x t_x1 t_x2 t_x3 t_x4 t_x5 t_y t_y1 t_y2 t_y3 t_y4 t_y5
            | 'd' -> avance Droite t_x t_x1 t_x2 t_x3 t_x4 t_x5 t_y t_y1 t_y2 t_y3 t_y4 t_y5
            | 'z' -> saut saut_H_bool saut_H_int grav
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
          Unix.sleepf 0.005
        end;
  done

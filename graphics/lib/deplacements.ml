open Graphics

type direction = Gauche | Droite | Haut | Bas

let mort pages x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 = 
  pages := 3;
  x1 := 430;
  x2 := 430;
  x3 := 427;
  x4 := 433;
  x5 := 427;
  x6 := 433;
  y1 := 460;
  y2 := 450;
  y3 := 450;
  y4 := 450;
  y5 := 440;
  y6 := 440

let avance dir x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 =
  match dir with
  | Gauche -> 
    x1 := !x1 - 2; 
    x2 := !x2 - 2; 
    x3 := !x3 - 2; 
    x4 := !x4 - 2; 
    x5 := !x5 - 2; 
    x6 := !x6 - 2;
  | Droite -> 
    x1 := !x1 + 2; 
    x2 := !x2 + 2; 
    x3 := !x3 + 2; 
    x4 := !x4 + 2; 
    x5 := !x5 + 2; 
    x6 := !x6 + 2;
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
  if point_color !x1 (!y6 + 4) = white || point_color !x2 (!y6 + 4) = white || point_color !x3 (!y5 + 4) = white || point_color !x4 (!y5 + 4) = white || point_color !x5 (!y5 + 4) = white || point_color !x6 (!y5 + 4) = white
    then begin 
      avance Bas x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6;
      grav := true
    end
    else grav := false

let gravite_rules x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 saut_H_bool saut_H_int grav =
  if !saut_H_bool = true 
    then begin
      if !saut_H_int = 0 
        then begin
          saut_H_bool := false;
        end
        else begin
          avance Haut x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6;
          saut_H_int := !saut_H_int - 1
        end
    end
    else gravite x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 grav

let saut saut_H_bool saut_H_int grav =
  if !saut_H_bool = false && !grav = false
    then begin
      saut_H_bool := true;
      saut_H_int := 60
    end

let process_key c x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 saut_H_bool saut_H_int grav running = 
  match c with
  | 'a' -> running := false
  | 'd' -> avance Droite x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6
  | 'q' -> avance Gauche x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6
  | 'z' -> saut saut_H_bool saut_H_int grav
  | _ -> ()

let rec process_all_keys x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 saut_H_bool saut_H_int grav running =
  let st = wait_next_event [Poll] in
  if st.keypressed
  then begin
    let stk = wait_next_event [Key_pressed] in
    process_key stk.key x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 saut_H_bool saut_H_int grav running ;
    process_all_keys x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 saut_H_bool saut_H_int grav running
  end;
  synchronize ();
  Unix.sleepf 0.005
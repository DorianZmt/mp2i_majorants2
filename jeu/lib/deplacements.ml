open Graphics

type direction = Gauche | Droite | Haut | Bas

let mort pages x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 = 
  pages := 3;
  x1 := 10;
  x2 := 10;
  x3 := 7;
  x4 := 13;
  x5 := 7;
  x6 := 13;
  y1 := 160;
  y2 := 150;
  y3 := 150;
  y4 := 150;
  y5 := 140;
  y6 := 140

let avance dir x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 pages =
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
    if !y6 = 0 then mort pages x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6;
    y1 := !y1 - 1; 
    y2 := !y2 - 1; 
    y3 := !y3 - 1; 
    y4 := !y4 - 1; 
    y5 := !y5 - 1; 
    y6 := !y6 - 1

let gravite x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 grav pages =
  if point_color !x1 (!y6 + 4) = white
    then begin 
      avance Bas x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 pages;
      grav := true
    end
    else grav := false

let gravite_rules x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 saut_H_bool saut_H_int grav pages =
  if !saut_H_bool = true 
    then begin
      if !saut_H_int = 0 
        then begin
          saut_H_bool := false;
        end
        else begin
          avance Haut x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 pages;
          saut_H_int := !saut_H_int - 1
        end
    end
    else gravite x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 grav pages

let saut saut_H_bool saut_H_int grav =
  if !saut_H_bool = false && !grav = false
    then begin
      saut_H_bool := true;
      saut_H_int := 60
    end

let process_key c x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 saut_H_bool saut_H_int grav running pages= 
  match c with
  | 'a' -> running := false
  | 'q' -> avance Gauche x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 pages
  | 'd' -> avance Droite x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 pages
  | 'z' -> saut saut_H_bool saut_H_int grav
  | _ -> ()

let rec process_all_keys x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 saut_H_bool saut_H_int grav running pages=
  let st = wait_next_event [Poll] in
  if st.keypressed
  then begin
    let stk = wait_next_event [Key_pressed] in
    process_key stk.key x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 saut_H_bool saut_H_int grav running pages;
    process_all_keys x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 saut_H_bool saut_H_int grav running pages
  end;
  synchronize ();
  Unix.sleepf 0.005
open Graphics

type plateforme = {
  mutable position : int * int;
  mutable longueur : int;  
  mutable visible : bool
} 

let plat1 = {
  position = (150,350);
  longueur = 45;
  visible = true;
} 

let plat2 = {
  position = (375,380);
  longueur = 10;
  visible = true;
} 

let plat3 = {
  position = (250,420);
  longueur = 10;
  visible = true;
} 

let put_plateforme plateforme =
  let x,y = plateforme.position in
  moveto x y;
  if plateforme.visible  
    then begin
      let loop = ref 1 in
      while !loop < plateforme.longueur do
        set_color black;
        draw_string "_";
        incr loop;
      done;
    end

let mouv_plat3 plat dir = 
  let x,y = plat.position in
  if !dir = 1
    then begin
      if x <= 200
        then dir := 2
        else plat.position <- (x-1,y)
    end
    else begin
      if x >= 250
        then dir := 1
        else plat.position <- (x+1,y)
    end

let dir = ref 1

let put_all_plateforme ()=
  clear_graph ();
  mouv_plat3 plat3 dir;
  put_plateforme plat1;
  moveto 150 350;
  lineto 150 240;
  lineto 500 240;
  moveto 0 150;
  lineto 250 150;
  moveto 300 150;
  lineto 350 150;
  lineto 350 117;
  lineto 400 117;
  lineto 400 91;
  lineto 0 91;
  moveto 0 0;
  lineto 500 0;
  put_plateforme plat2;
  put_plateforme plat3

let spike up nb x y = 
  (*Entrée : true si up false si down, couleur, 
             nombre de pique, position du premier pique en int ref 
    Sortie : on place nb piques /\ de la couleur col sur la
    même ligne, en partant (x,y) *)
  set_color red ;
  moveto x y;
  if up
    then begin
      let count = ref nb in
      while !count > 0 do
        draw_string"/\\";
        count := !count - 1
      done
    end
    else begin
      let count = ref nb in
      while !count > 0 do
        draw_string"\\/";
        count := !count - 1
      done
    end

let spike_rules pages x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 = 
  if point_color (!x1 + 13) !y6 = red 
    || point_color (!x1 + 13) (!y1 + 13) = red 
    || point_color (!x1 + 13) !y2 = red
    || point_color (!x1 + 13) !y3 = red 
    || point_color (!x1 + 13) !y4 = red 
    || point_color (!x1 + 13) !y5 = red
    || point_color !x2 !y6 = red 
    || point_color !x2 (!y1 + 13) = red 
    || point_color !x2 !y2 = red
    || point_color !x2 !y3 = red 
    || point_color !x2 !y4 = red 
    || point_color !x2 !y5 = red
    || point_color !x3 !y6 = red 
    || point_color !x3 (!y1 + 13) = red 
    || point_color !x3 !y2 = red
    || point_color !x3 !y3 = red 
    || point_color !x3 !y4 = red 
    || point_color !x3 !y5 = red
    || point_color !x4 !y6 = red 
    || point_color !x4 (!y1 + 13) = red 
    || point_color !x4 !y2 = red
    || point_color !x4 !y3 = red 
    || point_color !x4 !y4 = red 
    || point_color !x4 !y5 = red
    || point_color !x5 !y6 = red 
    || point_color !x5 (!y1 + 13) = red 
    || point_color !x5 !y2 = red
    || point_color !x5 !y3 = red 
    || point_color !x5 !y4 = red 
    || point_color !x5 !y5 = red
    || point_color !x6 !y6 = red 
    || point_color !x6 (!y1 + 13) = red 
    || point_color !x6 !y2 = red
    || point_color !x6 !y3 = red 
    || point_color !x6 !y4 = red 
    || point_color !x6 !y5 = red
    then begin
      Deplacements.mort pages x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6
    end
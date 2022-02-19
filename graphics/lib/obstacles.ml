open Graphics

type plateforme = {
  mutable position : int * int;
  mutable longueur : int;  
  mutable visible : bool
} 

let plat1 = {
  position = (0,100);
  longueur = 10;
  visible = true;
} 

let plat2 = {
  position = (75,150);
  longueur = 10;
  visible = true;
} 

let plat3 = {
  position = (150,200);
  longueur = 10;
  visible = true;
} 

let plat4 = {
  position = (225,250);
  longueur = 10;
  visible = true;
} 

let plat5 = {
  position = (300,300);
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
        draw_string "_";
        incr loop;
      done;
    end

let put_all_plateforme ()=
  clear_graph ();
  put_plateforme plat1;
  put_plateforme plat2;
  put_plateforme plat3;
  put_plateforme plat4;
  put_plateforme plat5;
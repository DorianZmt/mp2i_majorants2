open Graphics

let x1,x2,x3,x4,x5,x6,y1,y2,y3,y4,y5,y6 = Affichage.t_x, Affichage.t_x1, Affichage.t_x2, Affichage.t_x3, Affichage.t_x4, Affichage.t_x5, Affichage.t_y, Affichage.t_y1, Affichage.t_y2, Affichage.t_y3, Affichage.t_y4, Affichage.t_y5

let start ()= 
  open_graph " 500x500";

  let frame = ref 0 in

  let running = ref true in

  let saut_H_int = ref 0 in 
  let saut_H_bool = ref false in 

  let grav = ref false in

  auto_synchronize false;

  let pages = ref 1 in

  while !running do
    incr frame;

    Deplacements.gravite_rules x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 saut_H_bool saut_H_int grav; (*On initialise la gravité*)
       
    if !pages = 1
      then begin
        Acceuil.start pages
      end
      else begin
        Obstacles.put_all_plateforme (); (*On initialise la salle*)
        Affichage.personnage x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6; (*On initialise le personnage*)
        Deplacements.process_all_keys x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 saut_H_bool saut_H_int grav running; (*On initialise l'input du clavier*)
      end;
  done
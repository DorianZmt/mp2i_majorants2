open Graphics

let start pages = 
  clear_graph ();
  set_color black;
  moveto 150 250;
  draw_string "AAAAAAAAAAAAAAAAAAA";
  if key_pressed()
  then begin
    match read_key () with
    | 'a' -> pages := 2;
    | _ -> ()
  end;
  Unix.sleepf 0.05

let mort pages =
  clear_graph ();
  set_color black;
  moveto 150 250;
  draw_string "TU ES MORT";
  if key_pressed()
  then begin
    match read_key () with
    | 'a' -> pages := 2;
    | _ -> ()
  end;
  Unix.sleepf 0.05

let jeu x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 saut_H_bool saut_H_int grav running pages x_spike y_spike =
  Obstacles.put_all_plateforme (); (*On initialise la salle*)
  Affichage.spikes x_spike y_spike;
  Affichage.personnage x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6; (*On initialise le personnage*)
  Deplacements.process_all_keys x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 saut_H_bool saut_H_int grav running pages; (*On initialise l'input du clavier*)
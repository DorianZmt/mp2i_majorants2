open Graphics

let start pages = 
  clear_graph ();
  set_color black;
  moveto 25 350;
  draw_string "On m'appelle Maryo et je dois sauver la princesse Piche;";
  moveto 35 330;
  draw_string "Aide moi a trouver la princesse et je te donnerai,";
  moveto 45 310;
  draw_string "le tresor sacre du royaume Champ Pie Non";
  moveto 250 150;
  draw_string "APPUIES SUR A POUR DEMARRER";
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
  moveto 75 250;
  draw_string "TU ES MORT, APPUIES SUR A POUR RECOMMENCER";
  if key_pressed()
  then begin
    match read_key () with
    | 'a' -> pages := 3;
    | _ -> ()
  end;
  Unix.sleepf 0.05

let fin pages =
  clear_graph ();
  set_color black;
  moveto 75 250;
  draw_string "TU AS SAUVE LA PRINCESSE...";
  if key_pressed()
  then begin
    match read_key () with
    | 'a' -> pages := 2;
    | _ -> ()
  end;
  Unix.sleepf 0.05

let jeu1 x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 saut_H_bool saut_H_int grav running =
  Obstacles.put_all_plateforme1 (); (*On initialise la salle*)
  Affichage.personnage x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6; (*On initialise le personnage*)
  Deplacements.process_all_keys x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 saut_H_bool saut_H_int grav running (*On initialise l'input du clavier*)

let jeu2 x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 saut_H_bool saut_H_int grav running =
  Obstacles.put_all_plateforme2 (); (*On initialise la salle*)
  Affichage.spikes ();
  Affichage.tube ();
  Affichage.personnage x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6; (*On initialise le personnage*)
  Deplacements.process_all_keys x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 saut_H_bool saut_H_int grav running (*On initialise l'input du clavier*)
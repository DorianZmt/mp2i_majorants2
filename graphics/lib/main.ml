open Graphics

let x1 = ref 250
let y1 = ref 280

let x2 = ref 250
let y2 = ref 270

let x3 = ref 247
let y3 = ref 270

let x4 = ref 253
let y4 = ref 270

let x5 = ref 247
let y5 = ref 260

let x6 = ref 253
let y6 = ref 260

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

    Obstacles.spike_rules pages x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6;
    Deplacements.gravite_rules x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 saut_H_bool saut_H_int grav; (*On initialise la gravité*)
    Deplacements.change_page pages x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6;
    Obstacles.fin pages x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6;
       
    if !pages = 1
      then begin
        Pages.start pages
      end
      else if !pages = 2 
      then begin
        Pages.jeu1 x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 saut_H_bool saut_H_int grav running 
      end
      else if !pages = 3 
      then begin 
        Pages.jeu2 x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 saut_H_bool saut_H_int grav running 
      end 
      else if !pages = 4 
        then begin
          Pages.mort pages
        end
      else Pages.fin pages 
  done
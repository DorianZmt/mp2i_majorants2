open Graphics

let x1 = ref 430
let y1 = ref 460

let x2 = ref 430
let y2 = ref 450

let x3 = ref 427
let y3 = ref 450 

let x4 = ref 433
let y4 = ref 450 

let x5 = ref 427
let y5 = ref 440 

let x6 = ref 433
let y6 = ref 440 

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
       
    if !pages = 1
      then begin
        Pages.start pages
      end
      else if !pages = 2 
      then begin
        Pages.jeu x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 saut_H_bool saut_H_int grav running 
      end
      else Pages.mort pages 
  done
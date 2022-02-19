open Graphics

let x1 = ref 10
let y1 = ref 160

let x2 = ref 10
let y2 = ref 150

let x3 = ref 7
let y3 = ref 150 

let x4 = ref 13 
let y4 = ref 150 

let x5 = ref 7 
let y5 = ref 140 

let x6 = ref 13 
let y6 = ref 140 

let x_spike = 150
let y_spike = 200

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
    Deplacements.gravite_rules x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 saut_H_bool saut_H_int grav pages; (*On initialise la gravité*)
       
    if !pages = 1
      then begin
        Pages.start pages
      end
      else if !pages = 2 
      then begin
        Pages.jeu x1 x2 x3 x4 x5 x6 y1 y2 y3 y4 y5 y6 saut_H_bool saut_H_int grav running pages x_spike y_spike
      end
      else Pages.mort pages 
  done
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
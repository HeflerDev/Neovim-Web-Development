"Change theme depending on the time of day

let hr = (strftime('%H'))

if hr >=17
  set background=dark
elseif hr >= 8
  set background=light
elseif hr >= 0
  set background=dark
endif

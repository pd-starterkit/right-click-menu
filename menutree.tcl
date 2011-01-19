

 { control 
     { conditionals
         {  sel moses change  } 
	 } 
	 {  flip  {  
	mapping/reverse abs
	 }  
	 }  
     {  "do once"  {  
	once onebang  }  
	 }  
 }  

 {  operations
     {  "simple math"
         { "+" "-" "*" "/" ">" ">=" "=" "!=" "=<" "<" "%"  } 
	 } 
	 { "higher math"
         { sin cos tan atan atan2 exp log abs sqrt pow } 
	 } 
	 {  logic
         { "&" "|" "&&" "||" ">>" "<<" } 
	 } 
     {  mapping
         {  mapping/amplitude_n autoscale breakpoint mapping/center_point mapping/circular mapping/cubic_seat mapping/circular_sigmoid mapping/curve_log } 
	 } 
 } 

 {  "file management"  {  	
	gui  { 
		openpanel unauthorized/mp3write~
		 } 
	 } 
 } 
 { "data conversion"  { 
	lists  { 
		mapping/tolist
		 } 
	 } 
	 { cartesian  { 
		mapping/cartesian2sperical mapping/vector
		 } 
	 } 
	 { polar  { 
		mapping/polar2cartesian zexy/pol2sph motex/pol2rec~
		 } 
	 } 
	 { ascii	 { 
		atoi makefilename prepend_ascii splitfilename
		 } 
	 } 
	 {  integer  {  
		itoa int list2int 
		 } 
	 } 
	 { symbol
		 { iem_symtoalist }  } 
	 { "limit data"
		 { clip~ }  } 
	 { midi
		 { mtof }  } 
	 { frequency
		 { ftom }  } 
	 { smoothing
		 { mapping/autoscale mapping/smooth mapping/speedlimiter- }  }  } 
 { audio
     { "audio output"
         { output~ ezdac~ }  } 
	 { "audio input"
         { adc~ }  } 
	 { transitions
	     { mapping/curve_fade  }  } 
	 { effects
         { hip~ lop~ unauthorized/beatify~ }  }  } 
 { video
	 { controls
		 { playlist~ pix_film gemWin }  } 
	 { transitions
		 { gemhead }  } 
	 { effects
		 { pix_kaleidoscope pix_refraction pix_alpha }  }  } 
 { communication
	 { osc
		 { dumpOSC routeOSC  }  } 
	 { web
		 { unauthorized/mp3amp~ unauthorized/mp3cast~ }  }  } 
 { 3d
	 { primitives
		 { sphere cube polygon curve }  } 
	 { "particle systems"
		 { +~ /~ *~ pow }  } 
	 { camera
		 { ch_gemwin }  } 
	 { lights
		 { world_light "world_light 101" }  }  } 
 { drawing
	 { lines
		 { +~ /~ *~ pow }  } 
	 { shapes
		 { rectangle circle ploygon triangle }  } 
	 { text
		 { text3d text }  }  } 
 { input
	 { computer
		 { cursor keyname  }  } 
	 { peripherals
		 { hid gemmouse gemkeyboard }  }  } 



vlog Encoder.v
vsim encoder
add wave *

set b 8'b0
force en 1
for { set a 0 }  {$a < 256} {incr a} {
	set b [format {%0*b} 8  $a ]
	puts "value of b: $b"
    force in $b
    run 
}

set b 8'b0
force en 0
for { set a 0 }  {$a < 256} {incr a} {

	set b [format {%0*b} 8  $a ]
	puts "value of b: $b"
    force in $b
    run 
}

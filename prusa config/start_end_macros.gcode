;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; START
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
G21 ;metric values
G90 ;absolute positioning
M82 ;set extruder to absolute mode
M107 ;start with the fan off
M140 S[first_layer_bed_temperature] ; Нагреваем стол до заданной температуры.
M104 S[first_layer_temperature] T0 ; Нагреваем ХОТЕНД до заданной температуры.
M190 S[first_layer_bed_temperature] ; Ждем нагрева стола.
M109 S[first_layer_temperature] T0 ; Ждем нагрева ХОТЕНДА.
start_music
G28 X0 Y0 ;move X/Y to min endstops
G28 Z0 ;move Z to min endstops
G1 Z15.0 F[travel_speed] ;move the platform down 15mm
G92 E0 ;zero the extruded length
G1 F200 E3 ;extrude 3mm of feed stock
G92 E0 ;zero the extruded length again
G1 F[travel_speed]
M117 Printing...
G5







;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; END
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
M104 S0 ; turn off extruder
M140 S0 ; turn off bed
M107
; G28 X0 ;Y0 ;move X/Y to min endstops, so the head is out of the way
G91 ;relative positioning
G1 E-1 F300 ;retract the filament a bit before lifting the nozzle, to release some of the pressure
G1 Z+5 E-5 ;X-20 Y-20 F[travel_speed] ;move Z up a bit and retract filament even more
G1 Z+5 
G1 Z+5
G28 X Y
M84 ; disable motors
end_music
G90
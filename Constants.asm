; ---------------------------------------------------------------------------
; Constants
; ---------------------------------------------------------------------------

sizeof_256x256:		equ $200				; size of one 256x256 tile
countof_256x256:	equ $52					; max number of 256x256 tiles
sizeof_256x256_all:	equ sizeof_256x256*countof_256x256	; size of all 256x256 tiles ($A400 bytes)
sizeof_16x16:		equ 8					; size of one 16x16 tile
countof_16x16:		equ $300				; max number of 16x16 tiles
sizeof_16x16_all:	equ sizeof_16x16*countof_16x16		; size of all 16x16 tiles ($1800 bytes)
sizeof_ost:		equ $40					; size of one OST in bytes
countof_ost:		equ $80					; number of OSTs in RAM
countof_ost_inert:	equ $20					; number of OSTs that don't interact with Sonic (including Sonic himself)
countof_ost_ert:	equ countof_ost-countof_ost_inert	; number of OSTs that do interact with Sonic ($60)
sizeof_plc:		equ 6					; size of one pattern load cue
countof_plc:		equ $10					; number of pattern load cues in RAM
sizeof_priority:	equ $80					; size of one priority section in sprite queue

level_max_width:	equ $40
level_max_height:	equ 8
sizeof_levelrow:	equ level_max_width*2			; level row, followed by background row
sizeof_level:		equ sizeof_levelrow*level_max_height	; includes background in $40 byte alternating strips

screen_width:		equ 320
screen_height:		equ 224
screen_top:		equ 128					; y coordinate of top edge of screen for sprites
screen_left:		equ 128					; x coordinate of left edge of screen for sprites
screen_bottom:		equ screen_top+screen_height		; y coordinate of bottom edge of screen for sprites (352)
screen_right:		equ screen_left+screen_width		; x coordinate of right edge of screen for sprites (448)

; VRAM data
vram_window:		equ $A000				; window nametable - unused
vram_fg:		equ $C000				; foreground nametable ($1000 bytes)
vram_bg:		equ $E000				; background nametable ($1000 bytes)
vram_sonic:		equ $F000				; Sonic graphics ($2E0 bytes)
tile_sonic:		equ vram_sonic/sizeof_cell
vram_sprites:		equ $F800				; sprite table ($280 bytes)
vram_hscroll:		equ $FC00				; horizontal scroll table ($380 bytes)

draw_base:		equ vram_fg				; base address for nametables, used by Calc_VRAM_Pos (must be multiple of $4000)
draw_fg:		equ $4000+(vram_fg-draw_base)		; VRAM write command + fg nametable address relative to base
draw_bg:		equ $4000+(vram_bg-draw_base)		; VRAM write command + bg nametable address relative to base

vram_crabmeat:		equ $8000				; crabmeat graphics
vram_bomb:		equ $8000				; bomb enemy graphics
vram_giantring:		equ $8000				; giant ring graphics
vram_orbinaut:		equ $8520				; orbinaut graphics
vram_buzz:		equ $8880				; buzz bomber graphics
vram_yadrin:		equ $8F60				; yadrin graphics
vram_cater:		equ $9FE0				; caterkiller graphics
vram_button:		equ $A1E0				; button graphics
vram_spikes:		equ $A360				; spikes graphics
vram_hspring:		equ $A460				; horizontal spring graphics
vram_vspring:		equ $A660				; vertical spring graphics
vram_animal1:		equ $B000				; animal graphics
vram_animal2:		equ $B240				; animal graphics
vram_credits:		equ $B400				; credits font graphics

vram_title_credits:	equ $14C0				; "Sonic Team Presents" title screen graphics
vram_title:		equ $4000				; main title screen graphics
vram_title_sonic:	equ $6000				; Sonic title screen graphics
vram_title_tm:		equ $A200				; "TM" graphics
vram_text:		equ $D000				; level select text graphics
vram_cont_sonic:	equ $A000				; oval & Sonic continue screen graphics
vram_cont_minisonic:	equ $AA20				; mini Sonic continue screen graphics
vram_error:		equ $F800				; error text graphics

sizeof_cell:		equ $20					; single 8x8 tile
sizeof_vram_fg:		equ sizeof_vram_row*32			; fg nametable, assuming 64x32 ($1000 bytes)
sizeof_vram_bg:		equ sizeof_vram_row*32			; bg nametable, assuming 64x32 ($1000 bytes)
sizeof_vram_sonic:	equ $17*sizeof_cell			; Sonic's graphics ($2E0 bytes)
sizeof_sprite:		equ 8					; one sprite in sprite table
countof_max_sprites:	equ $50					; max number of sprites that can be displayed
sizeof_vram_sprites:	equ sizeof_sprite*countof_max_sprites	; sprite table ($280 bytes)
sizeof_vram_hscroll:	equ $380
sizeof_vram_hscroll_padded:	equ $400
sizeof_vram_row:	equ 64*2				; single row of fg/bg nametable, assuming 64 wide

countof_color:		equ 16					; colours per palette line
countof_colour:		equ countof_color
countof_pal:		equ 4					; palette lines
sizeof_pal:		equ countof_color*2			; bytes in 1 palette line
sizeof_pal_all:		equ sizeof_pal*countof_pal		; bytes in all palette lines
palfade_line2:		equ sizeof_pal<<8
palfade_line3:		equ (sizeof_pal*2)<<8
palfade_line4:		equ (sizeof_pal*3)<<8
palfade_1:		equ countof_color-1
palfade_2:		equ (countof_color*2)-1
palfade_3:		equ (countof_color*3)-1
palfade_all:		equ (countof_color*4)-1

; Levels
id_GHZ:		equ 0
id_LZ:		equ 1
id_MZ:		equ 2
id_SLZ:		equ 3
id_SYZ:		equ 4
id_SBZ:		equ 5
id_EndZ:	equ 6
id_SS:		equ 7
id_GHZ_act1:	equ (id_GHZ<<8)+0				; $0000
id_GHZ_act2:	equ (id_GHZ<<8)+1				; $0001
id_GHZ_act3:	equ (id_GHZ<<8)+2				; $0002
id_LZ_act1:	equ (id_LZ<<8)+0				; $0100
id_LZ_act2:	equ (id_LZ<<8)+1				; $0101
id_LZ_act3:	equ (id_LZ<<8)+2				; $0102
id_MZ_act1:	equ (id_MZ<<8)+0				; $0200
id_MZ_act2:	equ (id_MZ<<8)+1				; $0201
id_MZ_act3:	equ (id_MZ<<8)+2				; $0202
id_SLZ_act1:	equ (id_SLZ<<8)+0				; $0300
id_SLZ_act2:	equ (id_SLZ<<8)+1				; $0301
id_SLZ_act3:	equ (id_SLZ<<8)+2				; $0302
id_SYZ_act1:	equ (id_SYZ<<8)+0				; $0400
id_SYZ_act2:	equ (id_SYZ<<8)+1				; $0401
id_SYZ_act3:	equ (id_SYZ<<8)+2				; $0402
id_SBZ_act1:	equ (id_SBZ<<8)+0				; $0500
id_SBZ_act2:	equ (id_SBZ<<8)+1				; $0501
id_SBZ_act3:	equ (id_LZ<<8)+3				; $0103
id_FZ:		equ (id_SBZ<<8)+2				; $0502
id_EndZ_good:	equ (id_EndZ<<8)+0				; $0600 - ending with all chaos emeralds (extra flowers)
id_EndZ_bad:	equ (id_EndZ<<8)+1				; $0601 - ending without all emeralds (no flowers)

; Colours
cBlack:		equ $000					; colour black
cWhite:		equ $EEE					; colour white
cBlue:		equ $E00					; colour blue
cGreen:		equ $0E0					; colour green
cRed:		equ $00E					; colour red
cYellow:	equ cGreen+cRed					; colour yellow
cAqua:		equ cGreen+cBlue				; colour aqua
cMagenta:	equ cBlue+cRed					; colour magenta

; Joypad input
bitStart:	equ 7
bitA:		equ 6
bitC:		equ 5
bitB:		equ 4
bitR:		equ 3
bitL:		equ 2
bitDn:		equ 1
bitUp:		equ 0
btnStart:	equ 1<<bitStart					; Start button	($80)
btnA:		equ 1<<bitA					; A		($40)
btnC:		equ 1<<bitC					; C		($20)
btnB:		equ 1<<bitB					; B		($10)
btnR:		equ 1<<bitR					; Right		($08)
btnL:		equ 1<<bitL					; Left		($04)
btnDn:		equ 1<<bitDn					; Down		($02)
btnUp:		equ 1<<bitUp					; Up		($01)
btnDir:		equ btnL+btnR+btnDn+btnUp			; Any direction	($0F)
btnABC:		equ btnA+btnB+btnC				; A, B or C	($70)

; Sonic physics
sonic_max_speed:		equ $600
sonic_max_speed_roll:		equ $1000			; rolling
sonic_acceleration:		equ $C
sonic_deceleration:		equ $80
sonic_max_speed_water:		equ sonic_max_speed/2		; underwater
sonic_acceleration_water:	equ sonic_acceleration/2
sonic_deceleration_water:	equ sonic_deceleration/2
sonic_max_speed_shoes:		equ sonic_max_speed*2		; with speed shoes
sonic_acceleration_shoes:	equ sonic_acceleration*2
sonic_deceleration_shoes:	equ sonic_deceleration
sonic_min_speed_roll:		equ $80				; speed required to trigger roll
sonic_min_speed_slope:		equ $280			; speed required to overcome gravity on steep slopes
sonic_jump_power:		equ $680			; initial jump power
sonic_jump_power_water:		equ $380			; initial jump power underwater
sonic_jump_release:		equ $400			; jump speed after releasing A/B/C
sonic_jump_release_water:	equ sonic_jump_release/2
sonic_max_speed_surface:	equ $1000			; y speed coming out of water
sonic_buoyancy:			equ $28
sonic_ss_max_speed:		equ $800			; special stage

sonic_width:			equ 18/2			; half width while standing
sonic_height:			equ 38/2			; half height while standing
sonic_width_roll:		equ 14/2			; half width while rolling
sonic_height_roll:		equ 28/2			; half height while rolling
sonic_average_radius:		equ 20/2			; half width/height used for quick collision checks
sonic_width_hitbox:		equ 16/2			; half width of hitbox for object collision
sonic_height_hitbox:		equ 32/2			; half height of hitbox for object collision
sonic_height_hitbox_duck:	equ 20/2			; half height of hitbox for object collision while ducking

camera_y_shift_up:		equ $C8				; v_camera_y_shift when looking up
camera_y_shift_default:		equ $60				; v_camera_y_shift normally
camera_y_shift_down:		equ 8				; v_camera_y_shift when ducking

; Times
sonic_shoe_time:		equ 20*60			; time in frames that speed shoes last (20 seconds)
sonic_invincible_time:		equ 20*60			; time in frames that invincibility lasts (20 seconds)
sonic_flash_time:		equ 2*60			; time in frames that Sonic flashes after being hit (2 seconds)
ring_delay:			equ 30				; time in frames before Sonic is able to collect rings after being hit (0.5 seconds)
sonic_lock_time_slope:		equ 30				; time in frames that controls are locked when stuck on a slope (0.5 seconds)
sonic_lock_time_bubble:		equ 35				; time in frames that controls are locked after collecting a bubble (0.58 seconds)
sonic_lock_time_spring:		equ 15				; time in frames that controls are locked after jumping on a spring (0.25 seconds)
sonic_lock_time_slide:		equ 5				; time in frames that controls are locked after leaving a LZ slide (0.08 seconds)
air_full:			equ 30				; time in seconds that Sonic can hold his breath
air_ding1:			equ 25
air_ding2:			equ 20
air_ding3:			equ 15
air_alert:			equ 12				; time in seconds remaining when music changes to drowning alert
debug_move_delay:		equ 12				; time in frames between holding the d-pad in debug mode and the object moving

; Object physics
bumper_power:			equ $700
spring_power_red:		equ $1000
spring_power_yellow:		equ $A00
debug_move_speed:		equ 15 				; initial speed object moves in debug mode when d-pad is held (1px per frame)

lives_start:			equ 3				; lives at start of game
rings_for_life:			equ 100				; rings needed for first extra life
rings_for_life2:		equ 200				; rings needed for second extra life
rings_for_special_stage:	equ 50				; rings needed for special stage giant ring to appear
rings_for_continue:		equ 50				; rings needed for continue in special stage
rings_from_monitor:		equ 10				; rings given by ring monitor
combo_max:			equ 16*2			; value at which v_enemy_combo gives the max points
combo_max_points:		equ 10000/10			; points given after 16 enemies are broken in a row
bonus_points_per_ring:		equ 100/10			; points given per ring at the end of a level
points_for_life:		equ 50000/10			; points needed for extra life (awarded every 50000 points without cap)
countof_emeralds:		equ 6				; number of chaos emeralds

; Object variables
		pusho						; save options
		opt	ae+					; enable auto evens
			rsset 0
ost_id:			rs.b 1					; 0 ; object id
ost_render:		rs.b 1					; 1 ; bitfield for x/y flip, display mode
	render_xflip_bit:	equ 0
	render_yflip_bit:	equ 1
	render_rel_bit:		equ 2
	render_bg_bit:		equ 3
	render_useheight_bit:	equ 4
	render_rawmap_bit:	equ 5
	render_behind_bit:	equ 6
	render_onscreen_bit:	equ 7
	render_xflip:		equ 1<<render_xflip_bit		; xflip
	render_yflip:		equ 1<<render_yflip_bit		; yflip
	render_rel:		equ 1<<render_rel_bit		; relative screen position - coordinates are based on the level
	render_abs:		equ 0<<render_rel_bit		; absolute screen position - coordinates are based on the screen (e.g. the HUD)
	render_bg:		equ 1<<render_bg_bit		; align to background
	render_useheight:	equ 1<<render_useheight_bit	; use ost_height to decide if object is on screen, otherwise height is assumed to be $20 (used for large objects)
	render_rawmap:		equ 1<<render_rawmap_bit	; sprites use raw mappings - i.e. object consists of a single sprite instead of multipart sprite mappings (e.g. broken block fragments)
	render_behind:		equ 1<<render_behind_bit	; object is behind a loop (Sonic only)
	render_onscreen:	equ 1<<render_onscreen_bit	; object is on screen
ost_tile:		rs.w 1					; 2 ; palette line & VRAM setting (2 bytes)
	tile_xflip:	equ $800
	tile_yflip:	equ $1000
	tile_pal1:	equ 0
	tile_pal2:	equ $2000
	tile_pal3:	equ $4000
	tile_pal4:	equ $6000
	tile_hi:	equ $8000
	tile_xflip_bit:	equ 3
	tile_yflip_bit:	equ 4
	tile_pal12_bit:	equ 5
	tile_pal34_bit:	equ 6
	tile_hi_bit:	equ 7
ost_mappings:		rs.l 1					; 4 ; mappings address (4 bytes)
ost_x_pos:		rs.l 1					; 8 ; x-axis position (2 bytes)
ost_x_sub:		equ __rs-2				; $A ; x-axis subpixel position (2 bytes)
ost_y_screen:		equ __rs-2				; $A ; y-axis position for screen-fixed items (2 bytes)
ost_y_pos:		rs.l 1					; $C ; y-axis position (2 bytes)
ost_y_sub:		equ __rs-2				; $E ; y-axis subpixel position (2 bytes)
ost_x_vel:		rs.l 1					; $10 ; x-axis velocity (2 bytes)
ost_y_vel:		equ __rs-2				; $12 ; y-axis velocity (2 bytes)
ost_inertia:		rs.w 1					; $14 ; potential speed (2 bytes)
ost_height:		rs.b 1					; $16 ; height/2
ost_width:		rs.b 1					; $17 ; width/2
ost_priority:		rs.w 1					; $18 ; sprite stack priority - 0 is highest, 7 is lowest
ost_displaywidth:	equ __rs-1				; $19 ; display width/2
ost_frame:		rs.b 1					; $1A ; current frame displayed
ost_anim_frame:		rs.b 1					; $1B ; current frame in animation script
ost_anim:		rs.w 1					; $1C ; current animation
ost_anim_restart:	equ __rs-1				; $1D ; restart animation flag / next animation number (Sonic)
ost_anim_time:		rs.w 1					; $1E ; time to next frame (1 byte) / general timer (2 bytes)
ost_anim_time_low:	equ __rs-1				; $1F ; used by some objects as master copy of timer
ost_col_type:		rs.b 1					; $20 ; collision response type - 0 = none; 1-$3F = enemy; $41-$7F = items; $81-BF = hurts; $C1-$FF = custom
ost_col_property:	rs.b 1					; $21 ; collision extra property
ost_status:		rs.b 1					; $22 ; orientation or mode
	status_xflip_bit:	equ 0
	status_yflip_bit:	equ 1
	status_air_bit:		equ 1
	status_jump_bit:	equ 2
	status_platform_bit:	equ 3
	status_rolljump_bit:	equ 4
	status_pushing_bit:	equ 5
	status_underwater_bit:	equ 6
	status_broken_bit:	equ 7
	status_xflip:		equ 1<<status_xflip_bit		; xflip
	status_yflip:		equ 1<<status_yflip_bit		; yflip (objects only)
	status_air:		equ 1<<status_air_bit		; Sonic is in the air (Sonic only)
	status_jump:		equ 1<<status_jump_bit		; jumping or rolling (Sonic only)
	status_platform:	equ 1<<status_platform_bit	; Sonic is standing on this (objects) / Sonic is standing on object (Sonic)
	status_rolljump:	equ 1<<status_rolljump_bit	; Sonic is jumping after rolling (Sonic only)
	status_pushing:		equ 1<<status_pushing_bit	; Sonic is pushing this (objects) / Sonic is pushing an object (Sonic)
	status_underwater:	equ 1<<status_underwater_bit	; Sonic is underwater (Sonic only)
	status_broken:		equ 1<<status_broken_bit	; object has been broken (enemies/bosses)
ost_respawn:		rs.b 1					; $23 ; respawn list index number
ost_routine:		rs.b 1					; $24 ; routine number
ost_routine2:		rs.b 1					; $25 ; secondary routine number
ost_solid:		equ ost_routine2			; $25 ; solid status flag
ost_angle:		rs.w 1					; $26 ; angle of floor or rotation - 0 = flat; $40 = vertical left; $80 = ceiling; $C0 = vertical right
ost_subtype:		rs.w 1					; $28 ; object subtype - must go last because some objects use this as a start address for a list (1 byte, but sometimes read as a word)
ost_used:		equ __rs-1				; bytes used by regular OST, everything after this is scratch RAM
		popo						; restore options
		inform	0,"0-$%h bytes of OST per object used, leaving $%h bytes of scratch RAM.",__rs-1,sizeof_ost-__rs
ost_enemy_combo:	equ $3E					; number of enemies broken in a row (0-$A) (2 bytes)

; Object variables used by Sonic
		rsobj SonicPlayer,$30
ost_sonic_flash_time:	rs.w 1					; $30 ; time Sonic flashes for after getting hit
ost_sonic_invincible_time: rs.w 1				; $32 ; time left for invincibility
ost_sonic_shoe_time:	rs.w 1					; $34 ; time left for speed shoes
ost_sonic_angle_right:	rs.b 1					; $36 ; angle of floor on Sonic's right side
ost_sonic_angle_left:	rs.b 1					; $37 ; angle of floor on Sonic's left side
ost_sonic_sbz_disc:	rs.w 1					; $38 ; 1 if Sonic is stuck to SBZ disc (1 byte, but written to as a word in KillSonic)
ost_sonic_restart_time:	rs.w 1					; $3A ; time until level restarts
ost_sonic_jump:		rs.b 1					; $3C ; 1 if Sonic is jumping
ost_sonic_on_obj:	rs.b 1					; $3D ; OST index of object Sonic stands on
ost_sonic_lock_time:	rs.w 1					; $3E ; time left for locked d-pad controls (jumping is allowed), e.g. after hitting a spring
		rsobjend

; Object variables used by bosses
		rsobj Boss
ost_boss_mode:		rs.b 1					; $29 ; $FF = lifting block (SYZ only)
ost_boss_seesaw:	rs.w 3					; $2A ; addresses of OSTs of seesaws (SLZ only; 2 bytes * 3)
ost_boss_parent_x_pos:	rs.w 1					; $30 ; parent x position
		rsset $34
ost_boss_parent:	rs.l 1					; $34 ; address of OST of parent object - child only
ost_boss_parent_y_pos:	rs.w 1					; $38 ; parent y position
		rsset $3C
ost_boss_wait_time:	rs.w 1					; $3C ; time to wait between each action
ost_boss_flash_num:	rs.b 1					; $3E ; number of times to make boss flash when hit
ost_boss_wobble:	rs.b 1					; $3F ; wobble state as Eggman moves back & forth (1 byte incremented every frame & interpreted by CalcSine)
		rsobjend

; Boss variables
hitcount_all:		equ 8					; number of hits to beat boss
hitcount_ghz:		equ hitcount_all
hitcount_mz:		equ hitcount_all
hitcount_syz:		equ hitcount_all
hitcount_lz:		equ hitcount_all
hitcount_slz:		equ hitcount_all
hitcount_fz:		equ hitcount_all
boss_flash_color:	equ cWhite				; colour boss flashes when hit

; Animation flags
afEnd:		equ $FF						; return to beginning of animation
afBack:		equ $FE						; go back (specified number) bytes
afChange:	equ $FD						; run specified animation
afRoutine:	equ $FC						; increment routine counter
afReset:	equ $FB						; reset animation and 2nd object routine counter
af2ndRoutine:	equ $FA						; increment 2nd routine counter
afxflip:	equ $20
afyflip:	equ $40

; 16x16 row/column redraw flags (v_fg_redraw_direction)
redraw_top_bit:		equ 0
redraw_bottom_bit:	equ 1
redraw_left_bit:	equ 2
redraw_right_bit:	equ 3
redraw_topall_bit:	equ 4
redraw_bottomall_bit:	equ 5
redraw_bg2_left_bit:	equ 0					; REV01 only
redraw_bg2_right_bit:	equ 1					; REV01 only
redraw_top:		equ 1<<redraw_top_bit			; 1
redraw_bottom:		equ 1<<redraw_bottom_bit		; 2
redraw_left:		equ 1<<redraw_left_bit			; 4
redraw_right:		equ 1<<redraw_right_bit			; 8
redraw_topall:		equ 1<<redraw_topall_bit		; $10
redraw_bottomall:	equ 1<<redraw_bottomall_bit		; $20

; 16x16 and 256x256 mappings
tilemap_xflip_bit:	equ $B
tilemap_yflip_bit:	equ $C
tilemap_solid_top_bit:	equ $D
tilemap_solid_lrb_bit:	equ $E
tilemap_xflip:		equ 1<<tilemap_xflip_bit		; $800
tilemap_yflip:		equ 1<<tilemap_yflip_bit		; $1000
tilemap_solid_top:	equ 1<<tilemap_solid_top_bit		; $2000
tilemap_solid_lrb:	equ 1<<tilemap_solid_lrb_bit		; $4000
tilemap_solid_all:	equ tilemap_solid_top+tilemap_solid_lrb	; $6000

; Special Stages
ss_block_width:		equ $18					; width of blocks in grid (walls, items, et al)
ss_width:		equ $80					; width of level in blocks, including $20 padding on both sides
ss_width_actual:	equ $40					; width of level in blocks, without padding
ss_width_padding_left:	equ (ss_width-ss_width_actual)/2	; amount of padding on left side ($20 bytes)
ss_height_actual:	equ $40					; height of level in blocks, without padding
ss_height_padding_top:	equ $20					; amount of padding on top side
sizeof_ss_padding_top:	equ ss_height_padding_top*ss_width
ss_visible_width:	equ $10					; width of area in blocks that are drawn on screen
ss_visible_height:	equ ss_visible_width

ss_sprite_mappings:	equ 0					; mappings pointer in v_ss_sprite_info
ss_sprite_frame:	equ 4					; frame id in v_ss_sprite_info
ss_sprite_frame_low:	equ ss_sprite_frame+1
ss_sprite_tile:		equ 6					; tile id in v_ss_sprite_info
sizeof_ss_sprite_info:	equ 8					; size of each entry in v_ss_sprite_info (8 bytes)

ss_update_id:		equ 0					; sprite update id (1-6) in v_ss_sprite_update_list
ss_update_time:		equ 2					; time until next frame update
ss_update_frame:	equ 3					; frame within update data
ss_update_levelptr:	equ 4					; pointer to item in level layout being updated
sizeof_ss_update:	equ 8					; bytes in one update slot
countof_ss_update:	equ $20					; number of update slots

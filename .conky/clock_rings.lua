--==============================================================================
--                                 DebConky
--
--  author  : Andrez
--  version : 1.1
--  license : Distributed under the terms of GNU GPL
--
--==============================================================================
--
--------------------------------------------------------------------------------

require 'cairo'

--------------------------------------------------------------------------------
--                                                                    clock DATA
-- HOURS

settings_table = {
{
	name='time',			arg='%I.%M',
	x=160, 				y=155,			max=12,
	bg_colour=0xffffff,		bg_alpha=0.02,
	fg_colour=0xffffff,		fg_alpha=0.06,
	radius=50,
	thickness=10,
	start_angle=0,
	end_angle=360
},
-- MINUTES
{
	name='time',			arg='%M.%S',
	x=160,				y=155,			max=60,
	bg_colour=0xffffff,		bg_alpha=0.02,
	fg_colour=0xffffff,		fg_alpha=0.06,
	radius=65,
	thickness=15,
	start_angle=0,
	end_angle=360
},
-- SECONDS
{
	name='time',			arg='%S',	
	x=160, 				y=155,			max=60,
	bg_colour=0xffffff,		bg_alpha=0.02,
	fg_colour=0xffffff,		fg_alpha=0.06,
	radius=115,
	thickness=20,
	start_angle=0,
	end_angle=360
},
--------------------------------------------------------------------------------
--                                                                    System DATA
{
	name='cpu',			arg='cpu0',
	x=85, 				y=300,			max=100,
	bg_colour=0xffffff,		bg_alpha=0.1,
	fg_colour=0xffffff,		fg_alpha=0.3,
	radius=24,
	thickness=5,
	start_angle=-180,
	end_angle=90
},
{
	name='cpu',			arg='cpu1',
	x=85, 				y=300,			max=100,
	bg_colour=0xffffff,		bg_alpha=0.1,
	fg_colour=0xffffff,		fg_alpha=0.3,
	radius=18,
	thickness=5,
	start_angle=-180,
	end_angle=90
},
{
	name='memperc',			arg='',
	x=85, 				y=400,			max=100,
	bg_colour=0xffffff,		bg_alpha=0.1,
	fg_colour=0xffffff,		fg_alpha=0.3,
	radius=24,
	thickness=5,
	start_angle=-180,
	end_angle=90
},
{
	name='fs_used_perc',		arg='/home',
	x=85,				y=500,			max=100,
	bg_colour=0xffffff,		bg_alpha=0.1,
	fg_colour=0xffffff,		fg_alpha=0.3,
	radius=24,
	thickness=5,
	start_angle=-180,
	end_angle=90

},
{
	name='fs_used_perc',		arg='/',
	x=85, 				y=500,			max=100,
	bg_colour=0xffffff,		bg_alpha=0.1,
	fg_colour=0xffffff,		fg_alpha=0.3,
	radius=18,
	thickness=5,
	start_angle=-180,
	end_angle=90
},
{
	name='wireless_link_qual_perc',	arg='wlan0',
	x=85, 				y=600,			max=100,
	bg_colour=0xffffff,		bg_alpha=0.1,
	fg_colour=0xffffff,		fg_alpha=0.3,
	radius=24,
	thickness=5,
	start_angle=-180,
	end_angle=90
},
}

--------------------------------------------------------------------------------
--                                                                Clock Settings

clock_r=125
clock_x=160
clock_y=155

clock_colour=0xffffff
clock_alpha=0.5

show_seconds=true

-------------------------------------------------------------------------------
--                                                                 rgb_to_r_g_b
-- converts color in hexa to decimal
--
function rgb_to_r_g_b(colour,alpha)
	return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end
-------------------------------------------------------------------------------
--                                                               displays rings
-- 
--
function draw_ring(cr,t,pt)
	local w,h=conky_window.width,conky_window.height

	local xc,yc,ring_r,ring_w,sa,ea=pt['x'],pt['y'],pt['radius'],pt['thickness'],pt['start_angle'],pt['end_angle']
	local bgc, bga, fgc, fga=pt['bg_colour'], pt['bg_alpha'], pt['fg_colour'], pt['fg_alpha']

	local angle_0=sa*(2*math.pi/360)-math.pi/2
	local angle_f=ea*(2*math.pi/360)-math.pi/2
	local t_arc=t*(angle_f-angle_0)

	

	cairo_arc(cr,xc,yc,ring_r,angle_0,angle_f)
	cairo_set_source_rgba(cr,rgb_to_r_g_b(bgc,bga))
	cairo_set_line_width(cr,ring_w)
	cairo_stroke(cr)

	

	cairo_arc(cr,xc,yc,ring_r,angle_0,angle_0+t_arc)
	cairo_set_source_rgba(cr,rgb_to_r_g_b(fgc,fga))
	cairo_stroke(cr)
end
-------------------------------------------------------------------------------
--                                                          display clock hands
-- 
--
function draw_clock_hands(cr,xc,yc)
	local secs,mins,hours,secs_arc,mins_arc,hours_arc
	local xh,yh,xm,ym,xs,ys

	secs=os.date("%S")
	mins=os.date("%M")
	hours=os.date("%I")

	secs_arc=(2*math.pi/60)*secs
	mins_arc=(2*math.pi/60)*mins+secs_arc/60
	hours_arc=(2*math.pi/12)*hours+mins_arc/12

	

	xh=xc+0.7*clock_r*math.sin(hours_arc)
	yh=yc-0.7*clock_r*math.cos(hours_arc)
	cairo_move_to(cr,xc,yc)
	cairo_line_to(cr,xh,yh)

	cairo_set_line_cap(cr,CAIRO_LINE_CAP_ROUND)
	cairo_set_line_width(cr,5)
	cairo_set_source_rgba(cr,rgb_to_r_g_b(clock_colour,clock_alpha))
	cairo_stroke(cr)

	

	xm=xc+clock_r*math.sin(mins_arc)
	ym=yc-clock_r*math.cos(mins_arc)
	cairo_move_to(cr,xc,yc)
	cairo_line_to(cr,xm,ym)

	cairo_set_line_width(cr,3)
	cairo_stroke(cr)

	

	if show_seconds then
		xs=xc+clock_r*math.sin(secs_arc)
		ys=yc-clock_r*math.cos(secs_arc)
		cairo_move_to(cr,xc,yc)
		cairo_line_to(cr,xs,ys)

		cairo_set_line_width(cr,1)
		cairo_stroke(cr)
	end
end
-------------------------------------------------------------------------------
--                                                          display clock rings
-- 
--
function conky_clock_rings()
	local function setup_rings(cr,pt)
		local str=''
		local value=0

		str=string.format('${%s %s}',pt['name'],pt['arg'])
		str=conky_parse(str)

		value=tonumber(str)
		if value == nil then value = 0 end
		pct=value/pt['max']

		draw_ring(cr,pct,pt)
	end

	

	if conky_window==nil then return end
	local cs=cairo_xlib_surface_create(conky_window.display,conky_window.drawable,conky_window.visual, conky_window.width,conky_window.height)

	local cr=cairo_create(cs)	

	local updates=conky_parse('${updates}')
	update_num=tonumber(updates)

	if update_num>5 then
		for i in pairs(settings_table) do
			setup_rings(cr,settings_table[i])
		end
	end

	draw_clock_hands(cr,clock_x,clock_y)
end

/* See LICENSE file for copyright and license details. */
#include "push.c"

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 12;       /* snap pixel */
static const unsigned int gappih    = 20;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 20;       /* vert inner gap between windows */
static const unsigned int gappoh    = 20;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 20;       /* vert outer gap between windows and screen edge */
static const int smartgaps          = 1;        /* 1 means no outer gap when there is only one window */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;     /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "SF Mono:size=9", "RobotoMono Nerd Font:size=8" };
static const char dmenufont[]       = "RobotoMono Nerd Font:size=10";
static const char col_gray1[]       = "#1d1f21";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#f5f5f5";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#b294bb";
static const char col_mage[]        = "#4c4c4c";
static const char col_red[]        = "#ff0000";
static const unsigned int baralpha = 0xd0;
static const unsigned int borderalpha = OPAQUE;

static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm]  = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]   = { col_gray3, col_mage,  col_red },
	[SchemeTitle] = { col_gray3, col_gray1,  col_mage }
};
static const unsigned int alphas[][3]      = {
	/*               fg      bg        border     */
	[SchemeNorm] = { OPAQUE, baralpha, baralpha },
	[SchemeSel]  = { OPAQUE, baralpha, borderalpha },
	[SchemeTitle]  = { OPAQUE, baralpha, borderalpha },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Pavucontrol", "pavucontrol", "Volume Control", 0, 1,          -1 },
	{ "matplotlib", "matplotlib", "Figure 1", 0, 1,          -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* facto of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define XF86MonBrightnessDown	0x1008ff03
#define XF86MonBrightnessUp	0x1008ff02
#define XF86AudioMute		0x1008ff12
#define XF86AudioLowerVolume	0x1008ff11
#define XF86AudioRaiseVolume	0x1008ff13
#define XF86AudioMicMute	0x1008FFB2
#define XF86Display		0x1008FF59
#define XF86WLAN		0x1008FF95
#define MODKEY Mod4Mask
#define MODKEY2 Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
/* static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL }; */
static const char *dmenucmd[] = {"rofi", "-show", "drun", NULL};
static const char *termcmd[]  = { "st", NULL };
/* static const char *termcmd[]  = { "alacritty", NULL }; */
static const char *pavuctrlcmd[] = { "pavucontrol", NULL };
static const char *slockcmd[] = { "slock", NULL };
static const char *cmdbrightnessup[] = {"brightnessControl", "up", NULL };
static const char *cmdbrightnessdown[] = { "brightnessControl", "down", NULL };
static const char *cmdsoundup[] = { "volume", "up", NULL };
static const char *cmdsounddown[] = { "volume", "down", NULL };
static const char *cmdsoundtoggle[] = { "volume", "mute", NULL };
static const char *cmdmicmute[] = { "pactl", "set-source-mute", "@DEFAULT_SOURCE@", "toggle", NULL };
static const char *clipcmd[] = { "clipmenu", "-i", "-fn", dmenufont, NULL };
static const char *display[] = { "arandr", NULL };
static const char *wlan[] = { "networkmanager_dmenu", NULL };
static const char *ranger[] = { "st", "ranger", NULL };
static const char *maim[] = { "maim", "-s", "~/Pictures/$(date +%s).png", NULL };

/* this implements <alt-Tab> for dwm, put it in config.h  */

static int alt_tab_count = 0;

/* focus and restack a client */
static void focus_restack(Client *c)
   { if (c) { focus(c); restack(selmon); } }

static void start_alt_tab(const Arg *arg)
   { alt_tab_count = 0; }

static Client *next_visible(Client *c)
{
   for(/* DO_NOTHING */; c && !ISVISIBLE(c); c=c->snext);
   return c;
}

static int count_visible(void)
{
   int count = 0;
   for (Client *c=next_visible(selmon->stack); c; c = next_visible(c->snext))
      count += 1;
   return count;
}

static Client *get_nth_client(int n)
{
   Client *c;
   for (c=next_visible(selmon->stack); c && n--; c = next_visible(c->snext));
   return c;
}

static void alt_tab(const Arg *arg)
{
   // put all of the windows back in their original focus/stack position */
   for (int i=0; i<alt_tab_count; i+=1)
      focus_restack(get_nth_client(alt_tab_count));

   // focus and restack the nth window */
   alt_tab_count = (alt_tab_count + 1) % count_visible();
   focus_restack(get_nth_client(alt_tab_count));
}

static Key keys[] = {
	/* modifier                     key        		function        argument */
        { 0,       XK_Alt_L,   start_alt_tab,  {0} },
        { MODKEY2,  XK_Tab,     alt_tab,        {0} },
	{ MODKEY,                       XK_p,      		spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_j,      		pushdown,       {0} },
	{ MODKEY|ShiftMask,             XK_k,      		pushup,         {0} },
	{ MODKEY|ShiftMask,             XK_Return, 		spawn,          {.v = termcmd } },
	{ 0,				XF86MonBrightnessDown,	spawn,	   	{.v = cmdbrightnessdown }},
	{ 0,				XF86MonBrightnessUp,	spawn,	   	{.v = cmdbrightnessup }},
	{ 0,				XF86AudioMute,		spawn,	   	{.v = cmdsoundtoggle}},
	{ 0,				XF86AudioRaiseVolume,	spawn,	   	{.v = cmdsoundup}},
	{ 0,				XF86AudioLowerVolume,	spawn,	   	{.v = cmdsounddown}},
	{ 0,				XF86AudioMicMute,	spawn,	   	{.v = cmdmicmute}},
	{ 0,				XF86Display,		spawn,	   	{.v = display}},
	{ MODKEY,			XK_n,			spawn,	   	{.v = wlan}},
	{ MODKEY,			XK_a,	   		spawn,	   	{.v = pavuctrlcmd}},
	{ MODKEY,			XK_F12,	   		spawn, 	   	{.v = slockcmd}},
	{ MODKEY,			XK_Insert, 		spawn,	   	{.v = clipcmd}},
	{ 0,				XK_Print, 		spawn,	   	{.v = maim}},
	{ MODKEY,			XK_Home,		spawn,		{.v = ranger}},
	{ MODKEY,                       XK_b,      		togglebar,      {0} },
	{ MODKEY,                       XK_j,      		focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      		focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      		incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      		incnmaster,     {.i = -1 } },
	{ MODKEY|ShiftMask,                       XK_h,      		setmfact,       {.f = -0.05} },
	{ MODKEY|ShiftMask,                       XK_l,      		setmfact,       {.f = +0.05} },
	{ MODKEY|Mod1Mask,              XK_h,      incrgaps,       {.i = +1 } },
	{ MODKEY|Mod1Mask,              XK_l,      incrgaps,       {.i = -1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_h,      incrogaps,      {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_l,      incrogaps,      {.i = -1 } },
	{ MODKEY|Mod1Mask|ControlMask,  XK_h,      incrigaps,      {.i = +1 } },
	{ MODKEY|Mod1Mask|ControlMask,  XK_l,      incrigaps,      {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_0,      togglegaps,     {0} },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_0,      defaultgaps,    {0} },
	{ MODKEY,                       XK_y,      incrihgaps,     {.i = +1 } },
	{ MODKEY,                       XK_o,      incrihgaps,     {.i = -1 } },
	{ MODKEY|ControlMask,           XK_y,      incrivgaps,     {.i = +1 } },
	{ MODKEY|ControlMask,           XK_o,      incrivgaps,     {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_y,      incrohgaps,     {.i = +1 } },
	{ MODKEY|Mod1Mask,              XK_o,      incrohgaps,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_y,      incrovgaps,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_o,      incrovgaps,     {.i = -1 } },
	{ MODKEY,                       XK_Return, 		zoom,           {0} },
	/* { MODKEY,                       XK_Tab,    		view,           {0} }, */
	{ MODKEY|ShiftMask,             XK_c,      		killclient,     {0} },
	{ MODKEY,                       XK_t,      		setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      		setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      		setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  		setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  		togglefloating, {0} },
	{ MODKEY,                       XK_0,      		view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      		tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  		focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, 		focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  		tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, 		tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      		0)
	TAGKEYS(                        XK_2,                      		1)
	TAGKEYS(                        XK_3,                      		2)
	TAGKEYS(                        XK_4,                      		3)
	TAGKEYS(                        XK_5,                      		4)
	TAGKEYS(                        XK_6,                      		5)
	TAGKEYS(                        XK_7,                      		6)
	TAGKEYS(                        XK_8,                      		7)
	TAGKEYS(                        XK_9,                      		8)
	{ MODKEY|ShiftMask,             XK_q,      		quit,           {0} },
	{ MODKEY,                       XK_Tab,      		shiftview,      {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_Tab,      		shiftview,      {.i = -1 } },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};


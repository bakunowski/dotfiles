/* user and group to drop privileges to */
static const char *user  = "nobody";
static const char *group = "nobody";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "#778899",   /* after initialization */
	[INPUT] =  "#778899",   /* during input */
	[FAILED] = "#cd5c5c",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

/* default message */
static const char * message = "";

/* text color */
static const char * text_color = "#080808";

/* text size (must be a valid size) */
static const char * font_name = "-xos4-terminus-bold-r-normal--32-320-72-72-c-160-iso10646-1";

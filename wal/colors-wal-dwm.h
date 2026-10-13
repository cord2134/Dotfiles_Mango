static const char norm_fg[] = "#b2c0dc";
static const char norm_bg[] = "#0c0b11";
static const char norm_border[] = "#7c869a";

static const char sel_fg[] = "#b2c0dc";
static const char sel_bg[] = "#58688E";
static const char sel_border[] = "#b2c0dc";

static const char urg_fg[] = "#b2c0dc";
static const char urg_bg[] = "#505266";
static const char urg_border[] = "#505266";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};

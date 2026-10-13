const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0c0b11", /* black   */
  [1] = "#505266", /* red     */
  [2] = "#58688E", /* green   */
  [3] = "#6D7291", /* yellow  */
  [4] = "#61739D", /* blue    */
  [5] = "#837C91", /* magenta */
  [6] = "#7285B4", /* cyan    */
  [7] = "#b2c0dc", /* white   */

  /* 8 bright colors */
  [8]  = "#7c869a",  /* black   */
  [9]  = "#505266",  /* red     */
  [10] = "#58688E", /* green   */
  [11] = "#6D7291", /* yellow  */
  [12] = "#61739D", /* blue    */
  [13] = "#837C91", /* magenta */
  [14] = "#7285B4", /* cyan    */
  [15] = "#b2c0dc", /* white   */

  /* special colors */
  [256] = "#0c0b11", /* background */
  [257] = "#b2c0dc", /* foreground */
  [258] = "#b2c0dc",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;

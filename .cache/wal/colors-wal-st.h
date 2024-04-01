const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#020203", /* black   */
  [1] = "#44527A", /* red     */
  [2] = "#4A5A87", /* green   */
  [3] = "#546796", /* yellow  */
  [4] = "#5A71A3", /* blue    */
  [5] = "#6176A5", /* magenta */
  [6] = "#739EC3", /* cyan    */
  [7] = "#bbd0e3", /* white   */

  /* 8 bright colors */
  [8]  = "#82919e",  /* black   */
  [9]  = "#44527A",  /* red     */
  [10] = "#4A5A87", /* green   */
  [11] = "#546796", /* yellow  */
  [12] = "#5A71A3", /* blue    */
  [13] = "#6176A5", /* magenta */
  [14] = "#739EC3", /* cyan    */
  [15] = "#bbd0e3", /* white   */

  /* special colors */
  [256] = "#020203", /* background */
  [257] = "#bbd0e3", /* foreground */
  [258] = "#bbd0e3",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;

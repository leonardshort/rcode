# load libraries
library(gcookbook)
library(plyr)
library(ggplot2)

# load tophitters2001 baseball dataset
tophit <- tophitters2001[1:25,]

# first plot (horizontal)
ggplot(tophit, aes(x=avg, y=reorder(name, avg))) + 
  geom_point(size=3) + 
  theme_bw() + 
  theme(panel.grid.major.x = element_blank(), 
        panel.grid.minor.x = element_blank(), 
        panel.grid.major.y = element_line(color='grey60', linetype='dashed'))

# second plot(vertical)
ggplot(tophit, aes(x=reorder(name, avg), y=avg)) + 
  geom_point(size=3) + 
  theme_bw() + 
  theme(axis.text.x = element_text(angle=60, hjust=1), 
        panel.grid.major.y = element_blank(), 
        panel.grid.minor.y = element_blank(), 
        panel.grid.major.x = element_line(color='grey60', linetype='dashed'))

# third plot (horizontal, NL/AL)
ggplot(tophit, aes(x=avg, y=name)) + 
  geom_segment(aes(yend=name), xend=0, color='grey50') + 
  geom_point(size=3, aes(color=lg)) + 
  scale_color_brewer(palette='Set1', limits=c('NL', 'AL')) + 
  theme_bw() + 
  theme(panel.grid.major.y = element_blank(), 
        legend.position=c(0.95, 0.55), 
        legend.justification=c(1, 0.5))

# fourth plot(AL/NL)
ggplot(tophit, aes(x=avg, y=name)) + 
  geom_segment(aes(yend=name), xend=0, color='grey50') + 
  geom_point(size=3, aes(color=lg)) + 
  scale_color_brewer(palette='Set1', limits=c('NL', 'AL'), guide=FALSE) + 
  theme_bw() + 
  theme(panel.grid.major.y = element_blank()) + 
  facet_grid(lg ~ ., scales='free_y', space='free_y')

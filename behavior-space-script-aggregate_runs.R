#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#
# An R script to aggregate data from 
# BehaviorSpace across runs at same parameter
# values.
#
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

library(colorspace)

#--------------------------------------------------
#
# LINES TO CHANGE
# VVVVVVVVVVVVVVV
#
#--------------------------------------------------

bs.data = read.csv('bass-abm Mean Degree Experiment-table.csv', skip = 6)
param.name = 'mean.degree'

# bs.data = read.csv('bass-abm Social Influence Experiment-table.csv', skip = 6)
# param.name = 'social.influence'

names(bs.data)

#--------------------------------------------------
#
# ^^^^^^^^^^^^^^^
# LINES TO CHANGE
#
#--------------------------------------------------

agg.out = aggregate(bs.data, by = list(bs.data$X.step., bs.data[[param.name]]), FUN = mean)

unique.params = unique(agg.out[[param.name]])

cols = rainbow_hcl(length(unique.params))

# xlim.use = range(bs.data$X.step.)
xlim.use = c(0, 150)

plot(0, 0, cex = 0, xlim = xlim.use, ylim = range(agg.out$count.turtles.with..adopted..), xlab = 'Time Step', ylab = 'Number Adopted')
for (param.ind in 1:length(unique.params)){
	param.val = unique.params[param.ind]
	lines(agg.out$count.turtles.with..adopted..[agg.out[[param.name]] == param.val], col = cols[param.ind], lwd = 1.5)
	legend('bottomright', legend = unique.params, col = cols, lty = 1, lwd = 5, cex = 0.75)
}
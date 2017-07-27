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

#--------------------------------------------------
#
# ^^^^^^^^^^^^^^^
# LINES TO CHANGE
#
#--------------------------------------------------

unique.params = unique(bs.data[[param.name]])

cols = rainbow_hcl(length(unique.params))

# xlim.use = range(bs.data$X.step.)
xlim.use = c(0, 150)

for (param.ind in 1:length(unique.params)){
	param.val = unique.params[param.ind]
	
	runs = unique(bs.data$X.run.number.[bs.data[[param.name]] == param.val])
	
	plot(0, 0, cex = 0, xlim = xlim.use, ylim = range(bs.data$count.turtles.with..adopted..), xlab = 'Time Step', ylab = 'Number Adopted', main = sprintf('%s = %g', param.name, param.val))
	
	for (run in runs){
	  lines(bs.data$count.turtles.with..adopted..[bs.data$X.run.number. == run], lwd = 1.5)
	}
}
for (run in 1:20){
  ts.data = read.csv(sprintf('model-selection-data/ts%g.dat', run), sep = ' ')
  
  plot(ts.data$timestep, ts.data$num.adopted, type = 'l')
}
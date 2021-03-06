library(shiny)
#library(grid)
#library(ggplot2)
#library(scales)
#library(MASS)
#library(ggthemes)
library(segmented)

df_new <- structure(list(symv = structure(1:74, .Label = c("159", "160", 
"170", "170/1", "174/1", "196", "224", "264", "264/1", "264/2", 
"264/3", "278", "279", "279/1", "279/2", "280", "282", "282/1", 
"283", "286", "287", "288", "289", "296", "299", "299/3", "299/4", 
"299/5", "311", "329", "392", "394", "395", "404", "407", "407/1", 
"443", "455", "463", "463/1", "465", "466", "467", "469", "469/1", 
"471", "472", "472/1", "473", "474", "475", "477", "480", "481", 
"494", "494/1", "497", "498", "501", "504", "509", "510", "511", 
"514", "528", "529", "533", "534", "539", "540", "544", "608", 
"628", "630"), class = "factor"), se.exelixi = structure(c(1L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 
1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L), .Label = "no", class = "factor"), 
T0P0 = c(11.285, 6.281, 13.512, 0, 0, 112.103, 44.658, 69.403, 
0, 0, 0, 55.945, 49.267, 0, 0, 18.565, 6.12, 0, 2.318, 12.15, 
0.081, 8.86, 7.198, 2.302, 33.337, 0, 0, 0, 11.451, 4.806, 
6.776, 1.186, 3.893, 0.111, 13.802, 0, 4.105, 0, 26.147, 
0, 81.794, 46.96, 1.503, 11.051, 0, 138.315, 16.975, 0, 10.858, 
4.773, 5.865, 25.117, 0.839, 4.448, 78.181, 0, 8.235, 1.795, 
9.041, 8.433, 5.033, 57.264, 224.2, 7.64, 0.947, 0.383, 122.245, 
63.8, 6.751, 58.819, 10.751, 22.33, 0.102, 1.541), T1P1 = c(3.503, 
0.763, 5.049, 0, 0, 4.858, 54.421, 228.611, 0, 0, 0, 56.222, 
179.418, 0, 0, 11.386, 0.183, 0, 0.464, 0.506, 0.698, 0.338, 
1.046, 0, 53.349, 0, 0, 0, 0.093, 0, 7.832, 0, 0.047, 1.556, 
0.879, 0, 0, 59.231, 118.514, 0, 56.785, 28.058, 0, 4.858, 
0, 20.519, 0.29, 0, 11.153, 0.312, 0, 11.632, 3.257, 0, 0.329, 
0, 0, 0.274, 0, 0.435, 0, 31.773, 72.718, 3.794, 0.222, 3.687, 
114.922, 23.512, 14.337, 43.776, 4.002, 4.745, 0.031, 0), 
TdP = c(0, 0, 0, 6.812, 1.266, 0, 0, 0, 63.518, 50.472, 12.793, 
0, 0, 6.765, 8.791, 0, 0, 0.699, 0, 0, 0, 0, 0, 0, 0, 18.662, 
10.908, 8.806, 0, 0, 0, 0, 0, 0, 0, 1.816, 0, 0, 0, 54.513, 
0, 0, 0, 0, 12.073, 0, 0, 1.882, 0, 0, 0, 0, 0, 0, 0, 1.205, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), T10P = c(0, 
0, 0, 0.879, 1.314, 0, 0, 0, 4.862, 30.408, 1.068, 0, 0, 
4.883, 5.501, 0, 0, 0.117, 0, 0, 0, 0, 0, 0, 0, 12.261, 2.557, 
0.265, 0, 0, 0, 0, 0, 0, 0, 0.048, 0, 0, 0, 8.407, 0, 0, 
0, 0, 2.379, 0, 0, 0.078, 0, 0, 0, 0, 0, 0, 0, 0.042, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), A = c(0.649, 
0.335, 1.114, 0.371, 0.102, 4.59, 4.668, 11.293, 0.865, 3.403, 
0.686, 2.874, 9.876, 0.376, 0.354, 2.181, 0.324, 0.05, 0.063, 
0.697, 0.058, 0.393, 0.311, 0.092, 6.463, 1.013, 0.213, 0.035, 
0.271, 0.163, 0.188, 0.016, 0.074, 0.177, 1.254, 0.153, 0.197, 
0.897, 4.487, 1.518, 7.159, 8.09, 0.031, 0.391, 0.337, 4.617, 
0.805, 0.087, 1.722, 0.295, 0.333, 2.776, 0.034, 0.43, 3.162, 
0.022, 0.009, 0.064, 0.374, 0.548, 0.498, 2.645, 13.85, 0.691, 
0.12, 0.563, 8.895, 2.872, 0.55, 6.868, 0.852, 0.993, 0.009, 
0.005), A0 = c(0.169, 0.085, 0, 0, 0, 0, 1.628, 0.324, 0, 
0, 0.206, 1.591, 0, 0, 0, 0, 0.23, 0.023, 0, 0.387, 0, 0, 
0.191, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.71, 0.106, 0, 0, 
0.975, 0.889, 3.43, 3.86, 0, 0, 0.2, 3.786, 0, 0, 0, 0.106, 
0, 0.427, 0.015, 0, 2.724, 0.022, 0, 0, 0.255, 0.144, 0, 
1.539, 8.997, 0.049, 0, 0, 4.024, 1.369, 0, 3.481, 0.808, 
0.22, 0, 0), A1 = c(0.48, 0.249, 1.114, 0.371, 0.102, 4.59, 
3.041, 10.969, 0.865, 3.403, 0.48, 1.283, 9.876, 0.376, 0.354, 
2.181, 0.094, 0.027, 0.063, 0.31, 0.058, 0.393, 0.12, 0.092, 
6.463, 1.013, 0.213, 0.035, 0.271, 0.163, 0.188, 0.016, 0.074, 
0.177, 0.543, 0.047, 0.197, 0.897, 3.513, 0.629, 3.729, 4.23, 
0.031, 0.391, 0.137, 0.831, 0.805, 0.087, 1.722, 0.188, 0.333, 
2.348, 0.019, 0.43, 0.438, 0, 0.009, 0.064, 0.119, 0.404, 
0.498, 1.106, 4.853, 0.641, 0.12, 0.563, 4.871, 1.503, 0.55, 
3.387, 0.043, 0.773, 0.009, 0.005), TP = c(27.374, 11.853, 
35.306, 0, 0, 173.082, 203.877, 627.961, 0, 0, 0, 225.813, 
418.58, 0, 0, 59.696, 8.447, 0, 5.063, 18.175, 1.474, 13.653, 
14.131, 2.302, 173.445, 0, 0, 0, 13.652, 4.806, 30.08, 1.186, 
4.867, 2.731, 21.855, 0, 4.105, 69.184, 256.167, 0, 274.976, 
148.462, 1.503, 30.806, 0, 278.342, 23.086, 0, 47.231, 7.61, 
5.865, 71.686, 8.14, 4.448, 89.4, 0, 8.235, 4.137, 9.041, 
12.753, 5.033, 174.805, 558.253, 23.386, 2.222, 14.529, 479.399, 
167.048, 42.207, 215.893, 27.983, 49.393, 0.258, 1.541)), .Names = c("symv", 
"se.exelixi", "T0P0", "T1P1", "TdP", "T10P", "A", "A0", "A1", 
"TP"), class = "data.frame", row.names = c("159", "160", "170", 
"170/1", "174/1", "196", "224", "264", "264/1", "264/2", "264/3", 
"278", "279", "279/1", "279/2", "280", "282", "282/1", "283", 
"286", "287", "288", "289", "296", "299", "299/3", "299/4", "299/5", 
"311", "329", "392", "394", "395", "404", "407", "407/1", "443", 
"455", "463", "463/1", "465", "466", "467", "469", "469/1", "471", 
"472", "472/1", "473", "474", "475", "477", "480", "481", "494", 
"494/1", "497", "498", "501", "504", "509", "510", "511", "514", 
"528", "529", "533", "534", "539", "540", "544", "608", "628", 
"630"))

rownames(df_new) <- df_new[,1]

# t.95 <- qnorm(1-(100-95)/100/2)

mod2 <- lm(A ~ TP-1, data=df_new,subset=(TdP==0))
#mod.s <- segmented(mod2, seg.Z = ~ TP-1, psi = c(150)) 
mod.s <- segmented(mod2, seg.Z = ~ TP-1, psi= NA, control = seg.control(it.max = 100, stop.if.error = FALSE, n.boot=0))


# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
  
  output$scatterPlot <- renderPlot({

    pred <- round(input$D_months / 12 * input$A_kEuro / 1000,2)
    fit.95 <- predict(mod.s,data.frame(TP=c(pred)), interval="prediction", level=0.95)
    
    def.par <- par(no.readonly = TRUE) # save default
    par(mar=c(5, 5, 4, 2) + 0.1, mgp=c(4,1,0))

    plot(A ~ TP,data=df_new[df_new$TdP==0,],pch=21,bg=rgb(252, 141, 98, max = 255),col=455,ylab="Cost escalation (MEURO)",
         xlab="Duration (years) * Amount (MEURO)",las=1, ylim=c(0,ifelse(fit.95[3]<14,14.3,fit.95[3]+.1)),
         xlim=c(0,ifelse(pred>600,pred+50,650)),
         main="Cost escalation estimation (with prediction Interval)")
    plot(mod.s,add=TRUE,link=FALSE,lwd=2,col=c(rgb(55, 126, 184, max = 255),rgb(77, 175, 74, max = 255)), 
         lty=c(2,2),conf.level=.80,shade=TRUE)
    lines(mod.s,col="darkturquoise",pch=19,bottom=FALSE,lwd=2,k=50, conf.level = 0.80)


    fit <- predict(mod.s,data.frame(TP=c(pred)), interval="prediction", level=as.numeric(input$confLevel)/100)

    points(pred,fit[1],pch=16,col="red",cex=1.5)
    segments(c(-25,pred),c(fit[1],-20),c(pred,pred),c(fit[1],fit[1]),col="red",lty=2)
    axis(1, at=pred, col.axis = "red", col="red", padj=-1.5, cex.axis=.8)
    axis(2, at=fit[1], labels=F, col="red")
    mtext(as.character(round(fit[1],2)), side=2, at=fit[1], padj=0.5, col="red", las=1, cex=1, adj=1.95)
    
    z <- fit[1] - fit[2]
    
    lines(c(pred,pred),c(fit[1]+z,fit[1]-z))
    lines(c(pred-25,pred+25),c(fit[1]+z, fit[1]+z))
    lines(c(pred-25,pred+25),c(fit[1]-z, fit[1]-z))
    
    lim.color <- switch(input$confLevel,
                        "80" = rgb(244, 109, 67, max = 255),
                        "90" = rgb(102, 189, 99, max = 255),
                        "95" = rgb(26, 152, 80, max = 255))
    
    text(pred-45, fit[1]+z, round(fit[3],1), cex=1, col=lim.color)
    text(pred+45, fit[1]-z, round(fit[2],1), cex=1, col=lim.color)
    
    par(def.par)  #- reset to default
    
  }, height='auto')
  
  
  output$tablePred <- renderTable({
    pred <- round(input$D_months / 12 * input$A_kEuro / 1000,2)
    fit <- predict(mod.s,data.frame(TP=c(pred)), interval="prediction", level=as.numeric(input$confLevel)/100)
    fit.df <- as.data.frame(round(fit,2))
    names(fit.df) <- c("Fitted value", "Lower limit", "Upper limit")
    fit.df
  })
  
#   output$info <- renderText({
#    
#     print("Η περιοχή εμπιστοσύνης Μέσης Πρόβλεψης εμφανίζεται σκιασμένη. Η τυρκουάζ γραμμή δείχνει το σημείο αλλαγής κλίσης και το 80% όριο εμπιστοσύνης της θέσης του.")  
# 
#   })
  
  output$caution <- renderText({
    if (round(input$D_months / 12 * input$A_kEuro / 1000,2) > 628) {    
      print("CAUTION! Estimation beyond the original observation range.")  
    }
  })
  
  output$diagTitle <- renderText({
    print("Model summary:")
  })
  
  # Generate a summary of the dataset
  output$summary <- renderPrint({
    #dataset <- datasetInput()
    summary(mod.s)
  })
  
  # generate diagnostic plots
  output$diagPlot <- renderPlot({   
    plot(mod.s)
  })
  
})

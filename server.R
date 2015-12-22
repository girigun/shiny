rm(list = ls(all = TRUE))
library(shiny)
library("png")
filenames <- dir("C:\\Users\\sai\\Desktop\shiny\\www\\","*.pdf")
value <- read.csv("C:\\Users\\sai\\Desktop\\shiny\\Process.csv",header=T,sep="\t")
print(value$label)
i <- sapply(value,is.factor)
value[i] <- lapply(value[i],as.character)
shinyServer(function(input,output){
        panelInput <- reactive({
                switch(input$id1,"1" = DataScienceToolkit,"2" = RProgramming,"3" = SttsticalInference,"4" = RegressionModels,"5" = GettingandCleaningData,
                       "6" = PracticalMachineLearning,"7" = ExploratoryDataAnalysis,"8" = ReproducibleResearch,"9" = 
                               DevelopingDataProducts,"10"=Shiny,"11"=swirl)
        })
        output$welcome <- renderPrint({
                print("Now let’s define a skeletal server implementation. To do this we call shinyServer and pass it a function that accepts two parameters: input and 			output:Our server function is empty for now but later we’ll use it to define the relationship between our inputs and outputs.We’ve now created the most minimal possible Shiny application. You can run the application by calling the runApp function as follows:")
        })
        output$Process<-renderText({
                if(input$id1 %in% value$label){
                        t<-grep(input$id1,value$label,value=F,ignore.case=T)
                        tex<-value$process[t]
                        print(value$process[t])
                }
                else if(!(input$id1 %in% value$label)){
                        print("yet to  know")
                }
        })
        output$Technology<-renderText({
                if(input$id1 %in% value$label){
                        t<-grep(input$id1,value$label,value=F,ignore.case=T)
                        tex<-value$technology[t]
                        print(value$technology[t])
                }
                else if(!(input$id1 %in% value$label)){
                        print("yet to be know")
                }
        })
        output$Objective<-renderText({
                if(input$id1 %in% value$label){
                        t<-grep(input$id1,value$label,value=F,ignore.case=T)
                        tex<-value$objective[t]
                        print(value$objective[t])
                }
                else if(!(input$id1 %in% value$label)){
                        print("yet to be know")
                }
        })
        fun <- function(){ return(input$id1)}
        output$site <- renderUI({
                if(input$id1 %in% value$label){
                        HTML('<script language="javascript" type="text/javascript">
                             var scrt_var = input$id1; 
                             alert(scrt_var)
                             </script>
                             <a href="" onclick="location.href=scrt_var;return true;">Link</a>
                             ') 
                }
                })
        output$Results <-renderImage({
                val2 <- input$id1
                val1 <-"C:\\Users\\sai\\Desktop\\shiny\\www\\image\\"
                val3 <-".png"
                print(val2)
                if(input$id1 %in% value$label){
                        return(list(
                                val <- paste(val1,val2,val3,sep=""),
                                src =val,
                                contentType = "image/png",
                                alt = "Face"
                        ))
                }
                else {
                        if(!(input$id1 %in% value$label)){
                                return(list(
                                        src ="C:\\Users\\sai\\Desktop\\shiny\\www\\image\\image.png",
                                        contentType = "image/png",
                                        alt = "Image"
                                ))
                        }}
        } , deleteFile = FALSE)
        output$Benefits <-renderText({
                if(input$id1 %in% value$label){
                        t<-grep(input$id1,value$label,value=F,ignore.case=T)
                        tex<-value$benefits[t]
                        print(value$benefits[t])
                }
                else if(!(input$id1 %in% value$label)){
                        print("yet to be know")
                }
        })
        output$report = downloadHandler(
                filename = paste("C:\\Users\\sai\\Desktop\\shiny\\www\\",input$id1,".pdf",sep=""),
                content = function(file) {
                        if(input$id1 %in% value$label){
                                file.show(paste("C:\\Users\\sai\\Desktop\\shiny\\www\\",input$id1,".pdf",sep=""), file)}
                },
                contentType = 'application/pdf'
        )
        output$Plots <-renderImage({
                val2 <- input$id1
                val1 <-"C:\\Users\\sai\\Desktop\\shiny\\www\\image\\"
                val3 <-".pdf"
                print(val2)
                if(input$id1 %in% value$label){
                        return(list(
                                val <- paste(val1,val2,val3,sep=""),
                                src =val,
                                contentType = "application/pdf",
                                alt = "Face"
                        ))
                }
                else {
                        if(!(input$id1 %in% value$label)){
                                return(list(
                                        src ="C:\\Users\\sai\\Desktop\\shiny\\www\\image\\image.png",
                                        contentType = "image/png",
                                        alt = "Image"
                                ))
                        }}
        } , deleteFile = FALSE)
        output$help <- renderUI({
                val <- paste("C:\\Users\\sai\\Desktop\\shiny\\www\\image\\",input$id1,".pdf",sep="")
                print(val)
                HTML('<iframe
					seamless=NA,
					src=val>')
        })
        
                })

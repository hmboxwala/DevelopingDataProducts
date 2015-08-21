library(shiny)
library(nnet)
set.seed(123)
fit <- nnet(Species~., data=iris, size=25,trace=FALSE)
shinyServer(
  function(input, output) {
    txt1 <- renderText({if (input$goButton > 0){
           isolate({
            if (input$text1<4.3|input$text1>7.9)
             { x1<<- "Input out of range"
            "Input out of range"}
           else
             {x1 <<-input$text1
             input$text1}})}})
    
    output$text1 <- txt1
    
    txt2 <- renderText({if (input$goButton > 0){
      isolate({
        if (input$text2<2|input$text2>4.4)
        { x2<<- "Input out of range"
          "Input out of range"}
        else
        {x2 <<-input$text2
         input$text2}})}})
    
    output$text2 <-  txt2
    
    txt3 <- renderText({if (input$goButton > 0){
      isolate({
        if (input$text3<1|input$text3>6.9)
        { x3<<- "Input out of range"
          "Input out of range"}
        else
          {x3 <<-input$text3
            input$text3}})}})
    
    output$text3 <- txt3
    
    txt4 <- renderText({if (input$goButton > 0){
      isolate({
        if (input$text4<0.1|input$text4>2.5)
        { x4<<- "Input out of range"
          "Input out of range"}
        else
        {x4 <<-input$text4
         input$text4}})}})
    
    output$text4 <- txt4
    
    txt5 <- renderText({if (input$goButton > 0){
        isolate({
            if(x1=="Input out of range"|x2=="Input out of range"|
                 x3=="Input out of range"|x4=="Input out of range")
               "Please correct the inputs and try again"
             else{
               predict(fit,newdata=data.frame(Sepal.Length=x1,
                                              Sepal.Width =x2,
                                              Petal.Length=x3,
                                              Petal.Width=x4),type="class")
             }})}})
    output$text5 <- txt5
  }
)
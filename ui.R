library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Predict Species of Iris!"),
  sidebarPanel(
    numericInput("text1", "Input Sepal Length (range: 4.3cm to 7.9cm)", 5.8, min = 4.3, max = 7.9, step = 0.1),
    numericInput("text2", "Input Sepal Width (range: 2.0cm to 4.4cm)", 3, min = 2.0, max = 4.4, step = 0.1),
    numericInput("text3", "Input Petal Length (range: 1.0cm to 6.9cm)", 4.35, min = 1.0, max = 6.9, step = 0.1),
    numericInput("text4", "Input Sepal Width (range: 0.1cm to 2.5cm)", 1.3, min = 0.1, max = 2.5, step = 0.1),
    actionButton("goButton", "Predict Species!")
 #   submitButton('Predict Species!')
  ),
  mainPanel(
    p('This app allows you to predict the species of of iris by giving as 
      input four measurements viz. Sepal length, Sepal width,Petal Length
      and Petal Width. The app uses nueral net algorithm to train the model on iris dataset 
       that comes inbuilt with R.'),
    p("You can use the below link to the iris dataset to try different 
      input values."),
    a("https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"),
    p('Sepal Length Entered'),
    verbatimTextOutput('text1'),
    p('Sepal Width Entered'),
    verbatimTextOutput('text2'),
    p('Petal Length Entered'),
    verbatimTextOutput('text3'),
    p('Petal Width Entered'),
    verbatimTextOutput('text4'),
    h3('Predicted Species!'),
    verbatimTextOutput('text5')
  )
))
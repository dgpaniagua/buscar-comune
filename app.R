library(shiny)
library(tidyverse)
load("rda/comuni.rda")

# Define UI for application
ui <- fluidPage(

    # Application title
    titlePanel("Búsqueda de nombres de comunas italianas"),
    
    helpText(HTML("En el proceso de búsqueda de la comuna de origen de nuestros antepasados, es habitual
    encontrar documentos en los que figura el nombre de la comuna pero que este resulta ilegible, 
    principalmente por mala caligrafía u ortografía. Como además generalmente conocemos pocas comunas,
    deducir de cuál se trata es aún más difícil.<br/><br/>
    
    Esta herramienta cuenta con una base de datos con todas las comunas italianas publicadas 
    la página web oficial www.istat.it (Instituto Nacional de Estadística de Italia), que
    puede descargarse <a href=https://www.istat.it/it/archivio/6789>aquí</a>.<br/><br/>
    
    El buscador permite ingresar un patron donde se utilizan puntos para reemplazar las letras que 
    no sean legibles. Los puntos funcionan como comodín y la búsqueda devolverá un listado con todos
    los resultados que cumplan con el patrón, respetando las letras ingresadas, su posición y la 
    longitud de la palabra.<br/><br/>
    
    Luego se deberá revisar el listado para ver si alguno de los resultados 
    obtenidos guarda relación con otros datos que podamos tener (región, provincia, etc).
    En caso de obtener pocos o nulos resultados, se recomienda reemplazar más letras por
    puntos dejando unas pocas letras de las que tengamos mayor seguridad, ya que muchas veces aunque
    la letra se entienda puede tratarse de un error de ortografía que no hayamos detectado 
    (s en lugar de z, letras dobles, etc.).<br/>
    Cuando se realiza la busqueda visualmente en el listado obtenido, es importante prestar
    atención a la fonética de la palabra y a los posibles errores de ortografía que podría 
    haber cometido la persona que escribió el acta.<br/><br/>"), style="text-align:justify; color: #000;"),

    # Sidebar with a text input for search term
    sidebarLayout(
        sidebarPanel(
            textInput("comune", "Ingresar patrón a buscar:",),
            helpText(HTML("Ejemplos:<br/>",
                          "Ingrese: .il.no  (entre los resultados aparecerá Milano).<br/>",
                          "Ingrese: t..in.   (entre los resultados aparecerá Torino)."))
        ),

        # Show result table
        mainPanel(
            tableOutput("table")
        )
    )
)

# Define server logic required to the regex search
server <- function(input, output) {

    output$table <- renderTable({
        comuni %>% filter(str_detect(comuni$name, regex(input$comune, ignore_case = TRUE)))
    })
}

# Run the application 
shinyApp(ui = ui, server = server)

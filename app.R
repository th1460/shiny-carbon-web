library(shiny)

source("src/carbonUiShell.R")
source("src/carbonDropdown.R")
source("src/carbonSlider.R")
source("src/carbonToggle.R")
source("src/carbonDatePicker.R")
source("src/carbonTag.R")
source("src/carbonGrid.R")

ui <- function(requests) {
    
    tagList(carbonGrid(),
            carbonUiShell("IBM Carbon", "Shiny"),
            tags$div(class = "bx--grid",
                tags$div(class = "bx--row", style = "margin-top: 5rem",
                    tags$div(class =  "bx--col",
                        carbonDropdown("dropdown", "", "Dropdown", 
                                       options = c("Foo" = "foo", "Bar" = "bar", "Baz" = "baz")),
                        tags$br(),
                        carbonSlider("slider", "Slider", 100, 0, 1, 50),
                        tags$br(),
                        carbonToggle("toggle", "On", "Toggle", "Off"),
                        tags$br(),
                        carbonDatePicker("date_picker", "single", "Date Picker", "mm/dd/yyyy"),
                        
                        tags$script(HTML('document.getElementById("dropdown").addEventListener("bx-dropdown-selected", (e) => {Shiny.setInputValue("dropdown", e.detail.item.value)});')),
                        tags$script(HTML('document.getElementById("slider").addEventListener("bx-slider-changed", (e) => {Shiny.setInputValue("slider", e.detail.value)});')),
                        tags$script(HTML('document.getElementById("toggle").addEventListener("bx-toggle-changed", (e) => {Shiny.setInputValue("toggle", e.target.__checked)});')),
                        tags$script(HTML('document.getElementById("date_picker").addEventListener("bx-date-picker-changed", (e) => {Shiny.setInputValue("date_picker", e.detail.selectedDates[0])});')),
                    ),
                    tags$div(class =  "bx--col",
                        h4("Results:"),
                        carbonTag("Dropdown:", "green"),
                        textOutput("resdropdown"),
                        tags$br(),
                        carbonTag("Slider:", "green"),
                        textOutput("resslider"),
                        tags$br(),
                        carbonTag("Toggle:", "green"),
                        textOutput("restoggle"),
                        tags$br(),
                        carbonTag("Date Picker:", "green"),
                        textOutput("resdate")
                        
                    )
                )
            )
    )
}

server <- function(input, output, session) {
    
    output$resdropdown <- renderText({
        input$dropdown
    })
    
    output$resslider <- renderText({
        input$slider
    })
    
    output$restoggle <- renderText({
        input$toggle
    })
    
    output$resdate <- renderText({
        as.character(as.Date(input$date_picker))
    })
    
}

shinyApp(ui, server)
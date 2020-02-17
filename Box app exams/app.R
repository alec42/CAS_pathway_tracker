library(shiny)
library(shinyWidgets) #useShinydashboardPlus
library(shinydashboardPlus) #gradientBox
library(shinydashboard) #valueBoxOutput
source(file = "modules.R")
ui <- fluidPage(
    useShinydashboardPlus(),
    titlePanel("Cheminement d'examens"),
    #### timeline ####
    timelineBlock(
        reversed = FALSE,
        timelineEnd(color = "danger"),
        timelineLabel("Examens préliminaires", color = "blue"),
        timelineItem(
            title = "Examen P",
            examBoxUI("P"),
            icon = "gears",
            color = "olive",
            time = "janvier de la première année",
            border = F
        ),
        timelineItem(
            title = "Examen FM",
            examBoxUI("FM"),
            icon = "gears",
            color = "olive",
            time = "mai de la première année",
            border = F
        ),
        timelineItem(
            title = "Examen IFM",
            icon = "gears",
            color = "olive",
            time = "mars ou juillet de la deuxième année",
            # footer = "Here is the footer",
            border = F
        ),
        timelineLabel("Examens intermediaires CAS", color = "orange"),
        timelineItem(
            title = "Examen MAS-I",
            icon = "gears",
            color = "olive",
            time = "avril ou octobre de la deuxième année",
            # footer = "Here is the footer",
            border = F
        ),
        timelineItem(
            title = "Examen MAS-II",
            icon = "gears",
            color = "olive",
            time = "avril ou octobre de la troisième année",
            # footer = "Here is the footer",
            border = F
        ),
        timelineLabel("Examens intermediaires SOA", color = "orange"),
        timelineItem(
            title = "Examen SRM",
            icon = "gears",
            color = "olive",
            time = "juin de la deuxième année",
            # footer = "Here is the footer",
            border = F
        ),
        timelineItem(
            title = "Examen PA",
            icon = "gears",
            color = "olive",
            time = "juin de la dernière année",
            # footer = "Here is the footer",
            border = F
        ),
        timelineItem(
            title = "Examen STAM",
            icon = "gears",
            color = "olive",
            time = "juin de la deuxième année",
            # footer = "Here is the footer",
            border = F
        ),
        timelineItem(
            title = "Examen LTAM",
            icon = "gears",
            color = "olive",
            time = "octobre de la troisième année",
            # footer = "Here is the footer",
            border = F
        ),
        timelineLabel("VEE", color = "green"),
        timelineItem(
            title = "Economics",
            icon = "gears",
            color = "maroon",
            time = "ECN-1000 et ECN-1001",
            # footer = "Here is the footer",
            border = F
        ),
        timelineItem(
            title = "Accounting and Finance",
            icon = "gears",
            color = "maroon",
            time = "CTB-1000 et ACT-1006",
            # footer = "Here is the footer",
            border = F
        ),
        timelineItem(
            title = "Mathematical Statistics",
            icon = "gears",
            color = "maroon",
            time = "ACT-2000",
            # footer = "Here is the footer",
            border = F
        ),
        # timelineItem(
        #     title = "Item 3",
        #     icon = "book",
        #     color = "maroon",
        #     timelineItemMedia(src = "http://placehold.it/150x100"),
        #     timelineItemMedia(src = "http://placehold.it/150x100")
        # ),
        timelineStart(color = "gray")
    ),
    #### prelim ####
    fluidRow(
    boxPlus(width = "100%",
        title = "Examens Préliminaires",
        solidHeader = T,
        status = "info",
        closable = F,
        collapsible = T,
        collapsed = T,
        examBoxUI("P"),
        examBoxUI("FM"),
        examBoxUI("IFM"),
        gradientBox(
            title = "Examen IFM: Investissement et marchés financiers",
            width = 12,
            gradientColor = "blue",
            boxToolSize = "xs",
            closable = F,
            collapsible = T,
            accordion(
                accordionItem(
                    id = 1,
                    title = "Cours reliés",
                    color = "danger",
                    collapsed = FALSE,
                    navPills(
                        navPillsItem(
                            active = TRUE,
                            pillName = "Gestion du risque financier I", 
                            # pillColor = "black",
                            pillText = "ACT-1006"
                        ),
                        valueBox(value = "34%",
                                 icon = icon("weight"),
                                 subtitle = "matière couverte en ACT-1006",
                                 color = "blue",
                                 width = 0.2),
                        valueBox(value = "B",
                                 icon = icon("weight"),
                                 subtitle = "Note requise pour l'accréditation de l'examen",
                                 color = "green",
                                 width = 0.2),
                        navPillsItem(
                            active = TRUE,
                            pillName = "Gestion du risque financier II", 
                            # pillColor = "black",
                            pillText = "ACT-2011"
                        ),
                        valueBox(value = "59%",
                                 icon = icon("weight"),
                                 subtitle = "matière couverte en ACT-2011",
                                 color = "blue",
                                 width = 0.2),
                        valueBox(value = "B",
                                 icon = icon("weight"),
                                 subtitle = "Note requise pour l'accréditation de l'examen",
                                 color = "green",
                                 width = 0.2)
                    )
                ),
                accordionItem(
                    id = 2,
                    title = "Détails sur l'examen",
                    color = "warning",
                    collapsed = FALSE,
                    navPills(
                        navPillsItem(
                            active = TRUE,
                            pillName = "Périodes d'examination",
                            # pillColor = "black",
                            pillText = "mars, juillet, novembre"
                        ),
                        navPillsItem(
                            active = TRUE,
                            pillName = "Coût",
                            # pillColor = "black",
                            pillText = "350$" 
                        )
                    )
                )
            ),
            footer = fluidPage(
                "Progression",
                progressBar(id = "pb7", value = 40, display_pct = F, status = "warning")
            )
        )
    )),
    #### CAS ####
    fluidRow(
    boxPlus(width = "100%",
        title = "Examens CAS",
        solidHeader = T,
        status = "success",
        # background = "olive",
        closable = F,
        collapsible = T,
        collapsed = T,
        gradientBox(
            title = "Examen MAS-I: Modern Actuarial Statistics I",
            width = 12,
            gradientColor = "green",
            boxToolSize = "xs",
            closable = F,
            collapsible = T,
            valueBox(value = "Non-accréditable",
                     icon = icon("weight"),
                     subtitle = "Examen non-visé par le PAU",
                     color = "red",
                     width = 0.2),
            accordion(
                accordionItem(
                    id = 1,
                    title = "Cours reliés",
                    color = "danger",
                    collapsed = FALSE,
                    navPills(
                        navPillsItem(
                            active = TRUE,
                            pillName = "Analyse statistique des risques actuariels", 
                            # pillColor = "black",
                            pillText = "ACT-2000"
                        ),
                        valueBox(value = "X%",
                                 icon = icon("weight"),
                                 subtitle = "matière couverte en ACT-2000",
                                 color = "blue",
                                 width = 0.2),
                        navPillsItem(
                            active = TRUE,
                            pillName = "Modèles linéaires en actuariat", 
                            # pillColor = "black",
                            pillText = "ACT-2003"
                        ),
                        valueBox(value = "X%",
                                 icon = icon("weight"),
                                 subtitle = "matière couverte en ACT-2003",
                                 color = "blue",
                                 width = 0.2),
                        navPillsItem(
                            active = TRUE,
                            pillName = "Processus stochastiques", 
                            # pillColor = "black",
                            pillText = "ACT-2009"
                        ),
                        valueBox(value = "X%",
                                 icon = icon("weight"),
                                 subtitle = "matière couverte en ACT-2009",
                                 color = "blue",
                                 width = 0.2),
                        navPillsItem(
                            active = TRUE,
                            pillName = "Mathématiques actuarielles IARD I", 
                            # pillColor = "black",
                            pillText = "ACT-2005"
                        ),
                        valueBox(value = "X%",
                                 icon = icon("weight"),
                                 subtitle = "matière couverte en ACT-2005",
                                 color = "blue",
                                 width = 0.2),
                        box(
                            title = "Matière non-couverte",
                            solidHeader = T,
                            background = "light-blue",
                            status = "info",
                            width = NULL,
                            todoList(
                                sortable = FALSE,
                                todoListItem(
                                    label = "Séries chronologiques"
                                ),
                                todoListItem(
                                    label = "Reliability"
                                )
                            )
                        )
                    )
                ),
                accordionItem(
                    id = 2,
                    title = "Détails sur l'examen",
                    color = "warning",
                    collapsed = FALSE,
                    navPills(
                        navPillsItem(
                            active = TRUE,
                            pillName = "Périodes d'examination",
                            # pillColor = "black",
                            pillText = "avril, octobre"
                        ),
                        navPillsItem(
                            active = TRUE,
                            pillName = "Coût",
                            # pillColor = "black",
                            pillText = "360$" 
                        )
                    )
                )
            ),
            footer = fluidPage(
                "Progression",
                progressBar(id = "pb7", value = 50, display_pct = F, status = "warning")
            )
        ),
        gradientBox(
            title = "Examen MAS-II: Modern Actuarial Statistics II",
            width = 12,
            gradientColor = "green",
            boxToolSize = "xs",
            closable = F,
            collapsible = T,
            valueBox(value = "Non-accréditable",
                     icon = icon("weight"),
                     subtitle = "Examen non-visé par le PAU",
                     color = "red",
                     width = 0.2),
            accordion(
                accordionItem(
                    id = 1,
                    title = "Cours reliés",
                    color = "danger",
                    collapsed = FALSE,
                    navPills(
                        navPillsItem(
                            active = TRUE,
                            pillName = "Mathématiques actuarielles IARD II", 
                            # pillColor = "black",
                            pillText = "ACT-2008"
                        ),
                        valueBox(value = "X%",
                                 icon = icon("weight"),
                                 subtitle = "matière couverte en ACT-2008",
                                 color = "blue",
                                 width = 0.2),
                        navPillsItem(
                            active = TRUE,
                            pillName = "Apprentissage statistique en actuariat", 
                            # pillColor = "black",
                            pillText = "ACT-3114"
                        ),
                        valueBox(value = "X%",
                                 icon = icon("weight"),
                                 subtitle = "matière couverte en ACT-3114",
                                 color = "blue",
                                 width = 0.2),
                        box(
                            title = "Matière non-couverte",
                            solidHeader = T,
                            background = "light-blue",
                            status = "info",
                            width = NULL,
                            todoList(
                                sortable = FALSE,
                                todoListItem(
                                    label = "NA"
                                )
                            )
                        )
                    )
                ),
                accordionItem(
                    id = 2,
                    title = "Détails sur l'examen",
                    color = "warning",
                    collapsed = FALSE,
                    navPills(
                        navPillsItem(
                            active = TRUE,
                            pillName = "Périodes d'examination",
                            # pillColor = "black",
                            pillText = "avril, octobre"
                        ),
                        navPillsItem(
                            active = TRUE,
                            pillName = "Coût",
                            # pillColor = "black",
                            pillText = "360$" 
                        )
                    )
                )
            ),
            footer = fluidPage(
                "Progression",
                progressBar(id = "pb7", value = 60, display_pct = F, status = "warning")
            )
        )
    )),
    #### SOA ####
    fluidRow(
    boxPlus(width = "100%",
        title = "Examens SOA",
        solidHeader = T,
        status = "danger",
        closable = F,
        collapsible = T,
        collapsed = T,
        gradientBox(
            title = "Examen SRM: Statistics for Risk Modeling",
            width = 12,
            gradientColor = "red",
            boxToolSize = "xs",
            closable = F,
            collapsible = T,
            accordion(
                accordionItem(
                    id = 1,
                    title = "Cours reliés",
                    color = "danger",
                    collapsed = FALSE,
                    navPills(
                        navPillsItem(
                            active = TRUE,
                            pillName = "Modèles linéaires en actuariat", 
                            # pillColor = "black",
                            pillText = "ACT-2003"
                        ),
                        valueBox(value = "52%",
                                 icon = icon("weight"),
                                 subtitle = "matière couverte en ACT-2003",
                                 color = "blue",
                                 width = 0.2),
                        valueBox(value = "A-",
                                 icon = icon("weight"),
                                 subtitle = "Note requise pour l'accréditation de l'examen",
                                 color = "red",
                                 width = 0.2),
                        navPillsItem(
                            active = TRUE,
                            pillName = "Apprentissage statistique en actuariat", 
                            # pillColor = "black",
                            pillText = "ACT-3114"
                        ),
                        valueBox(value = "33%",
                                 icon = icon("weight"),
                                 subtitle = "matière couverte en ACT-3114",
                                 color = "blue",
                                 width = 0.2),
                        valueBox(value = "B+",
                                 icon = icon("weight"),
                                 subtitle = "Note requise pour l'accréditation de l'examen",
                                 color = "green",
                                 width = 0.2),
                        box(
                            title = "Matière non-couverte",
                            solidHeader = T,
                            background = "light-blue",
                            status = "info",
                            width = NULL,
                            todoList(
                                sortable = FALSE,
                                todoListItem(
                                    label = "Séries chronologiques"
                                )
                            )
                        )
                    )
                ),
                accordionItem(
                    id = 2,
                    title = "Détails sur l'examen",
                    color = "warning",
                    collapsed = FALSE,
                    navPills(
                        navPillsItem(
                            active = TRUE,
                            pillName = "Périodes d'examination",
                            # pillColor = "black",
                            pillText = "janvier, mai, septembre"
                        ),
                        navPillsItem(
                            active = TRUE,
                            pillName = "Coût",
                            # pillColor = "black",
                            pillText = "325$" 
                        )
                    )
                )
            ),
            footer = fluidPage(
                "Progression",
                progressBar(id = "pb7", value = 45, display_pct = F, status = "warning")
            )
        ),
        gradientBox(
            title = "Examen PA: Predictive Analytics",
            width = 12,
            gradientColor = "green",
            boxToolSize = "xs",
            closable = F,
            collapsible = T,
            valueBox(value = "Non-accréditable",
                     icon = icon("weight"),
                     subtitle = "Examen non-visé par le PAU",
                     color = "red",
                     width = 0.2),
            accordion(
                accordionItem(
                    id = 1,
                    title = "Cours reliés",
                    color = "danger",
                    collapsed = FALSE,
                    navPills(
                        navPillsItem(
                            active = TRUE,
                            pillName = "Modèles linéaires en actuariat", 
                            # pillColor = "black",
                            pillText = "ACT-2003"
                        ),
                        valueBox(value = "X%",
                                 icon = icon("weight"),
                                 subtitle = "matière couverte en ACT-2003",
                                 color = "blue",
                                 width = 0.2),
                        navPillsItem(
                            active = TRUE,
                            pillName = "Apprentissage statistique en actuariat", 
                            # pillColor = "black",
                            pillText = "ACT-3114"
                        ),
                        valueBox(value = "X%",
                                 icon = icon("weight"),
                                 subtitle = "matière couverte en ACT-3114",
                                 color = "blue",
                                 width = 0.2),
                        box(
                            title = "Matière non-couverte",
                            solidHeader = T,
                            background = "light-blue",
                            status = "info",
                            width = NULL,
                            todoList(
                                sortable = FALSE,
                                todoListItem(
                                    label = "NA"
                                )
                            )
                        )
                    )
                ),
                accordionItem(
                    id = 2,
                    title = "Détails sur l'examen",
                    color = "warning",
                    collapsed = FALSE,
                    navPills(
                        navPillsItem(
                            active = TRUE,
                            pillName = "Périodes d'examination",
                            # pillColor = "black",
                            pillText = "juin, décembre"
                        ),
                        navPillsItem(
                            active = TRUE,
                            pillName = "Coût",
                            # pillColor = "black",
                            pillText = "1125$" 
                        )
                    )
                )
            ),
            footer = fluidPage(
                "Progression",
                progressBar(id = "pb7", value = 50, display_pct = F, status = "warning")
            )
        ),
        gradientBox(
            title = "Examen STAM: Short-Term Actuarial Mathematics",
            width = 12,
            gradientColor = "red",
            boxToolSize = "xs",
            closable = F,
            collapsible = T,
            accordion(
                accordionItem(
                    id = 1,
                    title = "Cours reliés",
                    color = "danger",
                    collapsed = FALSE,
                    navPills(
                        navPillsItem(
                            active = TRUE,
                            pillName = "Introduction à l'actuariat I", 
                            # pillColor = "black",
                            pillText = "ACT-1000"
                        ),
                        valueBox(value = "10%",
                                 icon = icon("weight"),
                                 subtitle = "matière couverte en ACT-1000",
                                 color = "blue",
                                 width = 0.2),
                        valueBox(value = "B",
                                 icon = icon("weight"),
                                 subtitle = "Note requise pour l'accréditation de l'examen",
                                 color = "green",
                                 width = 0.2),
                        navPillsItem(
                            active = TRUE,
                            pillName = "Introduction à l'actuariat II", 
                            # pillColor = "black",
                            pillText = "ACT-2001"
                        ),
                        valueBox(value = "20%",
                                 icon = icon("weight"),
                                 subtitle = "matière couverte en ACT-2000",
                                 color = "blue",
                                 width = 0.2),
                        valueBox(value = "Non-accréditable",
                                 icon = icon("weight"),
                                 subtitle = "Cours non-requis pour l'accréditation de l'examen",
                                 color = "red",
                                 width = 0.2),
                        navPillsItem(
                            active = TRUE,
                            pillName = "Mathématiques actuarielles IARD I", 
                            # pillColor = "black",
                            pillText = "ACT-2005"
                        ),
                        valueBox(value = "36%",
                                 icon = icon("weight"),
                                 subtitle = "matière couverte en ACT-2005",
                                 color = "blue",
                                 width = 0.2),
                        valueBox(value = "B",
                                 icon = icon("weight"),
                                 subtitle = "Note requise pour l'accréditation de l'examen",
                                 color = "green",
                                 width = 0.2),
                        navPillsItem(
                            active = TRUE,
                            pillName = "Mathématiques actuarielles IARD II", 
                            # pillColor = "black",
                            pillText = "ACT-2008"
                        ),
                        valueBox(value = "34%",
                                 icon = icon("weight"),
                                 subtitle = "matière couverte en ACT-2008",
                                 color = "blue",
                                 width = 0.2),
                        valueBox(value = "B",
                                 icon = icon("weight"),
                                 subtitle = "Note requise pour l'accréditation de l'examen",
                                 color = "green",
                                 width = 0.2),
                        box(
                            title = "Matière non-couverte",
                            solidHeader = T,
                            background = "light-blue",
                            status = "info",
                            width = NULL,
                            todoList(
                                sortable = FALSE,
                                todoListItem(
                                    label = "NA"
                                )
                            )
                        )
                    )
                ),
                accordionItem(
                    id = 2,
                    title = "Détails sur l'examen",
                    color = "warning",
                    collapsed = FALSE,
                    navPills(
                        navPillsItem(
                            active = TRUE,
                            pillName = "Périodes d'examination",
                            # pillColor = "black",
                            pillText = "février, juin, octobre"
                        ),
                        navPillsItem(
                            active = TRUE,
                            pillName = "Coût",
                            # pillColor = "black",
                            pillText = "300$" 
                        )
                    )
                )
            ),
            footer = fluidPage(
                "Progression",
                progressBar(id = "pb7", value = 55, display_pct = F, status = "warning")
            )
        ),
        gradientBox(
            title = "Examen LTAM: Long-Term Actuarial Mathematics",
            width = 12,
            gradientColor = "red",
            boxToolSize = "xs",
            closable = F,
            collapsible = T,
            accordion(
                accordionItem(
                    id = 1,
                    title = "Cours reliés",
                    color = "danger",
                    collapsed = FALSE,
                    navPills(
                        navPillsItem(
                            active = TRUE,
                            pillName = "Mathématiques actuarielles vie I", 
                            # pillColor = "black",
                            pillText = "ACT-2004"
                        ),
                        valueBox(value = "46%",
                                 icon = icon("weight"),
                                 subtitle = "matière couverte en ACT-2004",
                                 color = "blue",
                                 width = 0.2),
                        valueBox(value = "B",
                                 icon = icon("weight"),
                                 subtitle = "Note requise pour l'accréditation de l'examen",
                                 color = "green",
                                 width = 0.2),
                        navPillsItem(
                            active = TRUE,
                            pillName = "Mathématiques actuarielles vie II", 
                            # pillColor = "black",
                            pillText = "ACT-2007"
                        ),
                        valueBox(value = "32%",
                                 icon = icon("weight"),
                                 subtitle = "matière couverte en ACT-2007",
                                 color = "blue",
                                 width = 0.2),
                        valueBox(value = "B",
                                 icon = icon("weight"),
                                 subtitle = "Note requise pour l'accréditation de l'examen",
                                 color = "green",
                                 width = 0.2),
                        navPillsItem(
                            active = TRUE,
                            pillName = "Régimes de retraite", 
                            # pillColor = "black",
                            pillText = "ACT-4101"
                        ),
                        valueBox(value = "10%",
                                 icon = icon("weight"),
                                 subtitle = "matière couverte en ACT-4101",
                                 color = "blue",
                                 width = 0.2),
                        valueBox(value = "B",
                                 icon = icon("weight"),
                                 subtitle = "Note requise pour l'accréditation de l'examen",
                                 color = "green",
                                 width = 0.2),
                        box(
                            title = "Matière non-couverte",
                            solidHeader = T,
                            background = "light-blue",
                            status = "info",
                            width = NULL,
                            todoList(
                                sortable = FALSE,
                                todoListItem(
                                    label = "NA"
                                )
                            )
                        )
                    )
                ),
                accordionItem(
                    id = 2,
                    title = "Détails sur l'examen",
                    color = "warning",
                    collapsed = FALSE,
                    navPills(
                        navPillsItem(
                            active = TRUE,
                            pillName = "Périodes d'examination",
                            # pillColor = "black",
                            pillText = "avril, octobre"
                        ),
                        navPillsItem(
                            active = TRUE,
                            pillName = "Coût",
                            # pillColor = "black",
                            pillText = "300$" 
                        )
                    )
                )
            ),
            footer = fluidPage(
                "Progression",
                progressBar(id = "pb7", value = 60, display_pct = F, status = "warning")
            )
        )
    )
    )
)


server <- function(input, output, session) {
    callModule(examBox, "IFM")
}
    

shinyApp(ui = ui, server = server)

##  Need to automate defining the UAP from the list on the CIA's website
##  Need to automate obtaining the title and list of exams from the SOA and CAS's websites
##  Need to automate obtaining the cost and exam dates from the SOA and CAS websites
exams_list <- list(`P` = list(title = "Probability", level = "Preliminary", UAP = TRUE, cost = "250"),
                   `FM` = list(title = "Financial Mathematics", level = "Preliminary", UAP = TRUE, cost = "250"),
                   `IFM` = list(title = "Investment and Financial Markets", level = "Preliminary", UAP = TRUE, cost = "350"),
                   `MAS-I` = list(title = "Modern Actuarial Statistics I", level = "CAS", UAP = FALSE, cost = "360"),
                   `MAS-II` = list(title = "Modern Actuarial Statistics II", level = "CAS", UAP = FALSE, cost = "360"),
                   `SRM` =  list(title = "Statistics and Risk Modelling", level = "SOA", UAP = TRUE, cost = "325"),
                   `STAM` = list(title = "Short-Term Actuarial Mathematics", level = "SOA", UAP = TRUE, cost = "300"),
                   `LTAM` = list(title = "Long-Term Actuarial Mathematics", level = "SOA", UAP = TRUE, cost = "300"),
                   `PA` = list(title = "Predictive Analytics", level = "SOA", UAP = FALSE, cost = "1125"),
                   `5` =  list(title = "Basic Techniques for Ratemaking and Estimating Claim Liabilities", level = "CAS", UAP = FALSE))
##  Need to consider whether having this list is worth it or if I should just use the previous list
exams_levels <- list("Preliminary" = c("P", "FM", "IFM"),
                     "SOA" = c("SRM", "PA", "STAM", "LTAM"),
                     "CAS" = c("MAS-I", "MAS-II", "5"))
##  Automate this with the School's website
classes_list <- list(`ACT-1002` = "Analyse probabiliste des risques actuariels",
                     `ACT-1001` = "Mathématiques financières",
                     `ACT-1006` = "Gestion du risque financier I",
                     `ACT-2011` = "Gestion du risque financier II")
##  Automate sigle and the grade with the CIA's UAP website
##  Also, have a list or place where can easily update the percentage of matière seen in each class
exams_classes_list <- list(
    `P` = list(sigle = "ACT-1002", weight = "90%", grade = "B"),
    `FM` = list(sigle = "ACT-1001", weight = "94%", grade = "B+"),
    `IFM` = list(sigle = c("ACT-1006", "ACT-2011"), weight = c("34%", "59%"), grade = c("B", "B"))
)
##  Critical think which colours for what
gradient_colours <- list("Preliminary" = "blue",
                         "SOA" = "red",
                         "CAS" = "green")

examBoxUI <- function(exam) {
    ns <- NS(exam)
    
    # Variables des listes
    level <- exams_list[[exam]]$level
    sigles_cours <- exams_classes_list[[exam]]$sigle
    weights_cours <- exams_classes_list[[exam]]$weight
    grades_cours <- exams_classes_list[[exam]]$grade

    noms_cours <- vector(length = length(sigles_cours))
    for (i in seq_along(sigles_cours)) {
        noms_cours[i] <- classes_list[[sigles_cours[i]]]
    }
    
    gradientBox(
        title = paste0("Examen ", exam, ": ", exams_list[[exam]]$title),
        gradientColor = gradient_colours[[level]],
        width = 12, boxToolSize = "xs", closable = F, collapsible = T,
        accordion(
            accordionItem(id = 1,
                          title = "Cours reliés", color = "danger", collapsed = FALSE,
                          
                          ##    Need to figure out how to create as many navPills/valueBox as classes there aree
                          ##    So, need length(noms_cours) navPillsIttem & valueBoxes
                          ##    Also, need to include condition not to create the second valueBox if the exam is not a part of UAP
                          navPills(
                              uiOutput('mypills')  
                          #     navPillsItem(
                          #         active = TRUE,
                          #         pillName = noms_cours[1],
                          #         pillText = sigles_cours[1]
                          #     ),
                          #     valueBox(
                          #         value = weights_cours[1],
                          #         subtitle = paste0("matière couverte en ", sigles_cours[1]),
                          #         color = "blue", icon = icon("weight"), width = 0.2
                          #     ),
                          #     valueBox(
                          #         value = grades_cours[1],
                          #         subtitle = "Note requise pour l'accréditation",
                          #         color = "green", icon = icon("weight"), width = 0.2
                          #     )
                          #     ##    Ponder whether this can be properly implanted
                          #     ##    How to maintain a list of non-seen material?
                          #     # ,box(title = "Matière non-couverte",
                          #     #     solidHeader = T, background = "light-blue", status = "info", width = NULL,
                          #     #     todoList(
                          #     #         sortable = FALSE,
                          #     #         todoListItem(
                          #     #             label = "Statistiques d'ordre",
                          #     #             "Couvert en ACT-2000"
                          #     #         )
                          #     #     )
                          #     # )
                          )
            ),
            accordionItem(id = 2,
                          title = "Détails sur l'examen", color = "warning", collapsed = FALSE,
                          navPills(
                              ##  Need to get a list of this. Maybe actuarialzone's list?
                              # navPillsItem(
                              #     active = TRUE, pillName = "Périodes d'examination",
                              #     pillText = "janvier, mars, mai, juin, juillet, septembre, novembre"
                              # ),
                              navPillsItem(
                                  active = TRUE, pillName = "Coût",
                                  pillText = paste0(exams_list[[exam]]$cost, "$")
                              )
                          )
            )
        ),    
        footer = fluidPage(
            "Progression",
            ##  Create a list with exams from which we assign a weight I guess?
            progressBar(id = "pb7", value = 10, display_pct = F, status = "warning")
        )
    )
    
}

examBox <- function(input, output, session) {
    output$mypills <- renderUI({s
        lapply(seq_along(sigles_cours), function(i) {
            navPillsItem(
                active = TRUE,
                pillName = noms_cours[i],
                pillText = sigles_cours[i]
            )
            valueBox(
                value = weights_cours[i],
                subtitle = paste0("matière couverte en ", sigles_cours[i]),
                color = "blue", icon = icon("weight"), width = 0.2
            )
            valueBox(
                value = grades_cours[i],
                subtitle = "Note requise pour l'accréditation",
                color = "green", icon = icon("weight"), width = 0.2
            )
        })
    })
}


####    Périodes d'examens  ####
##  P
# navPillsItem(
#     active = TRUE, pillName = "Périodes d'examination",
#     pillText = "janvier, mars, mai, juin, juillet, septembre, novembre"
# ),
##  FM
# navPillsItem(
#     active = TRUE,
#     pillName = "Périodes d'examination",
#     # pillColor = "black",
#     pillText = "février, avril, juin, août, octobre, décembre"
# ),
##  IFM
# navPillsItem(
#     active = TRUE,
#     pillName = "Périodes d'examination",
#     # pillColor = "black",
#     pillText = "mars, juillet, novembre"
# ),

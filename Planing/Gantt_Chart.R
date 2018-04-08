#Code pour la réalisation d'un diagramme de Gantt

##Chargement des librairies
library(reshape2)
library(ggplot2)
###Netoyage de l'espace de travail
rm(list = ls())

##Création des tâches à réaliser
task1 <- c('Plannification du travail', '2018-04-03', '2018-04-06')
task2 <- c('Bibliographie', '2018-04-05', '2018-04-11')
task3 <- c('Collecte de la données', '2018-04-03', '2018-04-15')
task4 <- c('Documentation tech SGBD', '2018-04-15', '2018-04-22')
task5 <- c('Prise en main des donées', '2018-04-04', '2018-04-22')
task8 <- c('Choix donnée', '2018-04-09', '2018-04-29')
task6 <- c('Control IG', '2018-04-09', '2018-04-29')
task7 <- c('Planif mise en forme data', '2018-04-23', '2018-04-24')
task9 <- c('Mise en place du MPD', '2018-04-30', '2018-05-6')
task10 <- c('Choix exploitation données', '2018-05-07', '2018-05-13')
task11 <- c('Choix exploitation carto-grapique', '2018-05-07', '2018-05-13')
task12 <- c('Réalisations cartographiques', '2018-05-14', '2018-05-27')
#task13 <- c('Ecriture du rapport de stage', '2018-09-10', '2018-09-30')



##Mise en forme des tâche dans un tableau
df <- as.data.frame(rbind(task1, task2, task3, task4, task5, task6, task7, task8,
                          task9, task10, task11, task12))
names(df) <- c('task', 'start', 'end')
df$task <- factor(df$task, levels = df$task)
df$start <- as.Date(df$start)
df$end <- as.Date(df$end)
df_melted <- melt(df, measure.vars = c('start', 'end'))

##Plot Gantt Chart !
start_date <- as.Date('2018-04-03')

ggplot(df_melted, aes(value, task)) + 
  geom_line(size = 10) +
  labs(x = '', y = '', title = 'Gantt : SIG Projet SALCOLEVE') +
  theme_bw(base_size = 20) +
  theme(plot.title = element_text(hjust = 0.5),
        panel.grid.major.x = element_line(colour="black", linetype = "dashed"),
    
        axis.text.x = element_text(angle = 0)) +
  scale_x_date(date_labels = "%W", limits = c(start_date, NA), date_breaks = '1 week')

# see ?strptime if you want your date in a different format
# see http://docs.ggplot2.org/current/scale_date.html if you want to adjust the x-axis
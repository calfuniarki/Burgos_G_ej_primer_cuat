# Instalar y cargar paquetes necesarios (si aún no lo has hecho)
install.packages("readr") 
install.packages("ggplot2")
install.packages("dplyr")
library(dplyr)
library(ggplot2)
library(readr)

# Cargar el archivo CSV
df <- read_csv("C:/DATAGB/R/HDZ.csv")

# Resumen general de los datos
summary(df)

# Gráfico de número de publicaciones por año (histograma)
ggplot(df, aes(x = `Publication Year`)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black") + 
  labs(title = "Distribución de Publicaciones por Año",
       x = "Año de Publicación",
       y = "Número de Publicaciones")

# Gráfico de publicaciones por idioma (gráfico de torta / pie chart)
ggplot(df %>% filter(!is.na(Language)), aes(x = "", fill = Language)) +
  geom_bar(width = 1) +
  coord_polar("y", start = 0) +
  labs(title = "Distribución de Publicaciones por Idioma") +
  theme_void() # Elimina los ejes y etiquetas innecesarias para el gráfico de torta

# Gráfico de publicaciones por tipo (barras horizontales con colores)
ggplot(df, aes(x = `Item Type`, fill = `Item Type`)) +
  geom_bar() +
  labs(title = "Distribución de Tipos de Publicaciones",
       x = "Tipo de Publicación",
       y = "Número de Publicaciones") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  coord_flip() # Voltea los ejes para barras horizontales

# Publicaciones por autor (mostramos las primeras filas)
autor_publicaciones <- df %>%
  group_by(Author) %>% 
  summarise(Count = n()) %>% 
  arrange(desc(Count)) 

head(autor_publicaciones)


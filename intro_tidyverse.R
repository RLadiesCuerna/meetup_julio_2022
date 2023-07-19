library(dplyr)

df <- data.frame(x = letters,
                 y = 1:26,
                 z = sample(c(TRUE, FALSE), 26, replace = TRUE))
df

dt <- tibble(x = letters,
             y = 1:26,
             z = sample(c(TRUE, FALSE), 26, replace = TRUE))

dt

class(df)
class(dt)

head(df)
head(dt)


df
dt

library(readr)

mediciones_clima <- read_csv("datos/clima.csv")

mediciones_clima

write_csv(mediciones_clima, "datos/mi_tibble.csv")

library(datos)

## filtrado
pinguinos

filter(pinguinos, especie == "Adelia")

filter(pinguinos, masa_corporal_g <= 3000)

pinguinos_filtrados <- filter(pinguinos,
                              masa_corporal_g <= 3300,
                              especie == "Adelia")

select(pinguinos_filtrados,
       "especie",
       "isla",
       "masa_corporal_g")

pinguinos_modificados <- mutate(pinguinos,
                                masa_corporal_kg = masa_corporal_g/1000)

pinguinos_modificados <- relocate(pinguinos_modificados,
                                  masa_corporal_kg,
                                  .before = largo_pico_mm)
pinguinos_modificados

pinguinos_modificados <- relocate(pinguinos_modificados,
                                  masa_corporal_kg,
                                  .after = especie)

pinguinos_modificados

summarise(pinguinos,
          promedio_largo_pico = mean(largo_pico_mm, na.rm = TRUE))

summarise(pinguinos,
          promedio_largo_pico = mean(largo_pico_mm, na.rm = TRUE),
          desviacion_largo_pico = sd(largo_pico_mm, na.rm = TRUE))

pinguinos_agrupados <- group_by(pinguinos, especie)

summarise(pinguinos_agrupados,
          promedio_largo_pico = mean(largo_pico_mm, na.rm = TRUE),
          desviacion_largo_pico = sd(largo_pico_mm, na.rm = TRUE))

pinguinos_agrupados <- group_by(pinguinos, especie, isla)

pinguinos_agrupados

summarise(pinguinos_agrupados,
          promedio_largo_pico = mean(largo_pico_mm, na.rm = TRUE),
          desviacion_largo_pico = sd(largo_pico_mm, na.rm = TRUE))

tibble1 <- read_csv("datos/tibble1.csv")
tibble2 <- read_csv("datos/tibble2.csv")


tibble1
tibble2

# unión

left_join(tibble1, tibble2)
right_join(tibble1, tibble2)
inner_join(tibble1, tibble2)
full_join(tibble1, tibble2)











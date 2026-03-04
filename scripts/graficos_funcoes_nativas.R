# ===============================================================
# SCRIPT: graficos_funcoes_nativas.R
#
# Autoria: Isabella Sterza de Oliveira Butzen
# Vínculo acadêmico: Dissertação (Mestrado Profissional em Matemática em Rede Nacional – PROFMAT)
# Recurso educacional: MANUAL DIGITAL PARA CONSTRUÇÃO DE GRÁFICOS NO RSTUDIO: UM GUIA PRÁTICO EM LINGUAGEM R PARA DOCENTES
#
# Finalidade do script:
# - Reunir e documentar, de forma reprodutível, os comandos utilizados no recurso educacional.
# - Servir como material de apoio (apêndice e repositório) para execução, adaptação e estudo.
#
# Observação sobre reprodutibilidade:
# - Este script foi organizado para fins didáticos. Alguns trechos podem exigir ajuste de caminhos
#   (setwd, leitura de arquivos) conforme o ambiente do(a) usuário(a).
#
# Dados de entrada (exemplos utilizados no recurso):
# - "estudantes.csv"
# - "estudantes_tarefas_media.csv"
#
# Como citar (modelo sugerido):
# BUTZEN, Isabella Sterza de Oliveira. MANUAL DIGITAL PARA CONSTRUÇÃO DE GRÁFICOS NO RSTUDIO: 
# um guia prático em linguagem R para docentes. Toledo: Universidade Tecnológica Federal do 
# Paraná (UTFPR), 2026. Scripts e materiais suplementares disponíveis em: <URL do GitHub>. Acesso em: <data>.
#
# Última atualização: <19-01-2026>
# ===============================================================


### CARREGAR BIBLIOTECAS ###
library(readr)
library(dplyr)

### EXPORTAR DADOS ###

estudantes <- read_csv("estudantes.csv")
estudantes_tarefas <- read_csv("estudantes_tarefas_media.csv")

### CONHECENDO A BASE DE DADOS ###

View(estudantes)
str(estudantes)
estudantes$Horas_de_Estudo <- as.numeric(estudantes$Horas_de_Estudo) #Convertendo váriaveis necessarias

ncol(estudantes)
nrow(estudantes)
colnames(estudantes)


estudantes <- estudantes %>%
  rename(
    Nome = Nome,
    Serie = Serie,
    Idade = Idade,
    Horas_de_Estudo = "Horas de Estudo",
    Nota_em_Matematica = "Nota em Matemática",
    Extracurricular = Extracurricular,
    Presencas = Presenças,
    Sexo = Sexo,
    Musica_Favorita = "Música Favorita",
    Distancia_Escola_km = "Distância Escola (km)"
  )

####################################
### GRÁFICOS COM FUNÇÕES NATIVAS ###
####################################

# Gráfico de barras: barplot (usando ?barplot) 
#####
barplot(table(estudantes$Idade)) # grafico em cima de uma tabela de frequencia

# argumentos: 
# main: título principal do gráfico
# xlab: rótulo do eixo x
# ylab: rótulo do eixo y

barplot(table(estudantes$Idade),
        main = "Distribuição dos alunos por Idade",
        xlab = "Idade",
        ylab = "Frequência")

# space: define o espaço entre as barras proporcional a largura da barra.

barplot(table(estudantes$Idade),
        main = "Distribuição dos alunos por Idade",
        xlab = "Idade",
        ylab = "Frequência",
        space = 1) 

# xlim e ylim: define o limite para os eixos x e y (inicio, fim)
barplot(table(estudantes$Idade),
        main = "Distribuição dos alunos por Idade",
        xlab = "Idade",
        ylab = "Frequência",
        space = 1,
        ylim = c(0, 60))

# col:  define as cores do gráfico
barplot(table(estudantes$Idade),
        main = "Distribuição dos alunos por Idade",
        xlab = "Idade",
        ylab = "Frequência",
        space = 1,
        ylim = c(0, 60),
        col = "red")

barplot(table(estudantes$Idade),
        main = "Distribuição dos alunos por Idade",
        xlab = "Idade",
        ylab = "Frequência",
        space = 1,
        ylim = c(0, 60),
        col = c("red", "blue", "green", "yellow", "purple"))

barplot(table(estudantes$Idade),
        main = "Distribuição dos alunos por Idade",
        xlab = "Idade",
        ylab = "Frequência",
        space = 1,
        ylim = c(0, 60),
        col = c("red", "blue", "green")) #Quando tem menos cores é preenchido sozinho

# border: define a cor das bordas das barras (ou remove com NA)
barplot(table(estudantes$Idade),
        main = "Distribuição dos alunos por Idade",
        xlab = "Idade",
        ylab = "Frequência",
        space = 1,
        ylim = c(0, 60),
        col = c("red", "blue", "green", "yellow", "purple"),
        border = NA)

# legend.text: adiciona uma legenda no gráfico
barplot(table(estudantes$Idade),
                          main = "Distribuição dos alunos por Idade",
                          xlab = "Idade",
                          ylab = "Frequência",
                          space = 1,
                          ylim = c(0, 60),
                          col = c("red", "blue", "green", "yellow", "purple"),
                          border = NA,
                          legend.text = c("11 anos", "12 anos", "13 anos", "14 anos", "15 anos"))

# Se precisar ajudar o tamanho da legenda, utilizar args.legend (cex altera o tamanho do texto, x  e y controlam a posicao da legenda e inset ajusta o deslocamento)
barplot(table(estudantes$Idade),
        main = "Distribuição dos alunos por Idade",
        xlab = "Idade",
        ylab = "Frequência",
        space = 1,
        ylim = c(0, 60),
        col = c("red", "blue", "green", "yellow", "purple"),
        border = NA,
        legend.text = c("11 anos", "12 anos", "13 anos", "14 anos", "15 anos"),
        args.legend = list(cex = 0.8, # Reduz tamanho do texto
                            x = "topright", inset = -0.05))


# Adicionar os valores das frequências no gráfico (posicao_x, posicao_y, valores)
text(
  x = grafico_barras,             # Posições das barras no eixo x
  y = table(estudantes$Idade) + 2,     # Valores das barras + um deslocamento para cima
  labels = table(estudantes$Idade)      # Valores a serem exibidos
)

#####
# Histograma: hist (usando ?hist)
#####
hist(estudantes$Nota_em_Matematica)

# argumentos:
# main: título principal do gráfico
# xlab: rótulo do eixo x
# ylab: rótulo do eixo y
hist(estudantes$Nota_em_Matematica,
     main = "Distribuição das Notas em Matemática",
     xlab = "Nota em Matemática",
     ylab = "Frequência")

# xlim e ylim: define o limite para os eixos x e y (inicio, fim)
hist(estudantes$Nota_em_Matematica,
     main = "Distribuição das Notas em Matemática",
     xlab = "Nota em Matemática",
     ylab = "Frequência",
     xlim = c(0, 10),                  
     ylim = c(0, 50))                 

# breaks: define a quantidade de intervalos
hist(estudantes$Nota_em_Matematica,
     main = "Distribuição das Notas em Matemática",
     xlab = "Nota em Matemática",
     ylab = "Frequência",
     xlim = c(0, 10),                  
     ylim = c(0, 80),
     breaks = 6) # o R ajusta automaticamente para o valor mais adequado (nesse caso, ajustou para 5)

hist(estudantes$Nota_em_Matematica,
     main = "Distribuição das Notas em Matemática",
     xlab = "Nota em Matemática",
     ylab = "Frequência",
     xlim = c(0, 10),                  
     ylim = c(0, 30),
     breaks = seq(0, 10, by = 0.5)) #intervalos de 0 a 10 de 0.5 em 0.5

# col: define as cores do gráfico
hist(estudantes$Nota_em_Matematica,
     main = "Distribuição das Notas em Matemática",
     xlab = "Nota em Matemática",
     ylab = "Frequência",
     xlim = c(0, 10),                  
     ylim = c(0, 80),
     breaks = 5,
     col = "red")

hist(estudantes$Nota_em_Matematica,
     main = "Distribuição das Notas em Matemática",
     xlab = "Nota em Matemática",
     ylab = "Frequência",
     xlim = c(0, 10),                  
     ylim = c(0, 80),
     breaks = 5,
     col = c("red", "blue", "green", "yellow", "purple"))

hist(estudantes$Nota_em_Matematica,
     main = "Distribuição das Notas em Matemática",
     xlab = "Nota em Matemática",
     ylab = "Frequência",
     xlim = c(0, 10),                  
     ylim = c(0, 80),
     breaks = 5,
     col = c("red", "blue", "green", "yellow")) #Se a quantidade de breaks e cor for diferente, ele vai recomeçar a coloração

# border: define a cor das bordas das barras (ou remove com NA)
hist(estudantes$Nota_em_Matematica,
     main = "Distribuição das Notas em Matemática",
     xlab = "Nota em Matemática",
     ylab = "Frequência",
     xlim = c(0, 10),                  
     ylim = c(0, 80),
     breaks = 5,
     col = c("red", "blue", "green", "yellow", "purple"),
     border = NA)

# Colocar valores no histograma: hist para obter as contagens sem plotar
h <- hist(estudantes$Nota_em_Matematica,
          main = "Distribuição das Notas em Matemática",
          xlab = "Nota em Matemática",
          ylab = "Frequência",
          xlim = c(0, 10),                  
          ylim = c(0, 80),
          breaks = 5,
          col = c("red", "blue", "green", "yellow", "purple"),
          border = NA)

text(
  x = h$mids,                        # Posições dos intervalos no eixo x
  y = h$counts + 2,               # Valores das barras + um deslocamento para cima
  labels = h$counts                  # Valores a serem exibidos
)


#####
# Gráfico de setores: pie (usando ?pie)
#####
pie(table(estudantes$Serie))

# argumentos:
# main: título do gráfico
pie(
  table(estudantes$Serie),
  main = "Distribuição de Alunos por Série Escolar")

# labels: adiciona o valor e o nome da categoria
pie(
  table(estudantes$Serie),
  main = "Distribuição de Alunos por Série Escolar",
  labels = table(estudantes$Serie))

pie(
  table(estudantes$Serie),
  main = "Distribuição de Alunos por Série Escolar",
  labels = paste(round(100 * table(estudantes$Serie) / sum(table(estudantes$Serie)), 1), "%"))

pie(
  table(estudantes$Serie),
  main = "Distribuição de Alunos por Série Escolar",
  labels = paste(c("6 Ano", "7 Ano", "8 Ano", "9 Ano"), ":", table(estudantes$Serie)))

# col: define as cores do gráfico
pie(
  table(estudantes$Serie),
  main = "Distribuição de Alunos por Série Escolar",
  labels = paste(c("6 Ano", "7 Ano", "8 Ano", "9 Ano"), ":", table(estudantes$Serie)),
  col = c("red", "blue", "green", "yellow"))

pie(
  table(estudantes$Serie),
  main = "Distribuição de Alunos por Série Escolar",
  labels = paste(c("6 Ano", "7 Ano", "8 Ano", "9 Ano"), ":", round(100 * table(estudantes$Serie) / sum(table(estudantes$Serie)), 1), "%"),
  col = c("red", "blue", "green", "yellow"))


# border: define a cor das bordas das barras (ou remove com NA)
pie(
  table(estudantes$Serie),
  main = "Distribuição de Alunos por Série Escolar",
  labels = paste(c("6 Ano", "7 Ano", "8 Ano", "9 Ano"), ":", table(estudantes$Serie)),
  col = c("red", "blue", "green", "yellow"),
  border = NA)

pie(
  table(estudantes$Serie),
  main = "Distribuição de Alunos por Série Escolar",
  labels = paste(c("6 Ano", "7 Ano", "8 Ano", "9 Ano"), ":", round(100 * table(estudantes$Serie) / sum(table(estudantes$Serie)), 1), "%"),
  col = c("red", "blue", "green", "yellow"),
  border = NA)

# legend: (posicao, nome_categorias, cores_correspondentes)
pie(
  table(estudantes$Serie),
  main = "Distribuição de Alunos por Série Escolar",
  labels = paste(round(100 * table(estudantes$Serie) / sum(table(estudantes$Serie)), 1), "%"),
  col = c("red", "blue", "green", "yellow"),
  border = NA)

legend(
  "topright",                           
  legend = c("6º Ano", "7º Ano", "8º Ano", "9º Ano"),
  fill = c("red", "blue", "green", "yellow")
)

#####
# Gráfico de linhas: plot type: l
#####
plot(estudantes_tarefas$Semana,estudantes_tarefas$Nota, type = "l")

# argumentos:
# main: título principal do gráfico
# xlab: rótulo do eixo x
# ylab: rótulo do eixo y
plot(estudantes_tarefas$Semana,
     estudantes_tarefas$Nota,
     type = "l",
     main = "Distribuição de Notas de Tarefas por Semana",
     xlab = "Semana",
     ylab = "Média das Notas")

# xlim e ylim: define o limite para os eixos x e y (inicio, fim)
plot(estudantes_tarefas$Semana,
     estudantes_tarefas$Nota,
     type = "l",
     main = "Distribuição de Notas de Tarefas por Semana",
     xlab = "Semana",
     ylab = "Média das Notas",
     xlim = c(1, 10),                  
     ylim = c(6, 9)) 

plot(
    estudantes_tarefas$Semana, 
    estudantes_tarefas$Nota, 
    type = "l", 
    main = "Distribuição de Notas de Tarefas por Semana",
    xlab = "Semana",
    ylab = "Média das Notas",
    xlim = c(1,10), 
    ylim = c(min(estudantes_tarefas$Nota), max(estudantes_tarefas$Nota))) #limites de acordo com os valores da tabela                  
     

# col: define a cor da linha
plot(
    estudantes_tarefas$Semana, 
    estudantes_tarefas$Nota, 
    type = "l", 
    main = "Distribuição de Notas de Tarefas por Semana",
    xlab = "Semana",
    ylab = "Média das Notas",
    xlim = c(1,10), 
    ylim = c(min(estudantes_tarefas$Nota), max(estudantes_tarefas$Nota)),
    col = "red") 

# lwd: define a largura da linha 
plot(
    estudantes_tarefas$Semana, 
    estudantes_tarefas$Nota, 
    type = "l", 
    main = "Distribuição de Notas de Tarefas por Semana",
    xlab = "Semana",
    ylab = "Média das Notas",
    xlim = c(1,10), 
    ylim = c(min(estudantes_tarefas$Nota), max(estudantes_tarefas$Nota)),
    col = "red", 
    lwd = 2) 

# lty: define o tipo de linha (1 sólida (padrao), 2 tracejada, 3 pontinhada, entre outros)
plot(
    estudantes_tarefas$Semana, 
    estudantes_tarefas$Nota, 
    type = "l", 
    main = "Distribuição de Notas de Tarefas por Semana",
    xlab = "Semana",
    ylab = "Média das Notas",
    xlim = c(1,10), 
    ylim = c(min(estudantes_tarefas$Nota), max(estudantes_tarefas$Nota)),
    col = "red", 
    lwd = 2,
    lty = 2) 

# grid: adiciona linhas de grade ao grafico
plot(
  estudantes_tarefas$Semana, 
  estudantes_tarefas$Nota, 
  type = "l", 
  main = "Distribuição de Notas de Tarefas por Semana",
  xlab = "Semana",
  ylab = "Média das Notas",
  xlim = c(1,10), 
  ylim = c(min(estudantes_tarefas$Nota), max(estudantes_tarefas$Nota)),
  col = "red", 
  lwd = 2,
  lty = 1) 
grid()

grid(col = "blue", lty = 5, lwd = 0.8) # personalizando o grid

# Adicionando linhas de referencia no grid
abline(h = min(estudantes_tarefas$Nota), col = "blue", lty = 3, lwd = 2)
abline(h = mean(estudantes_tarefas$Nota), col = "green", lty = 3, lwd = 2)
abline(h = max(estudantes_tarefas$Nota), col = "black", lty = 3, lwd = 2)


#####
# Gráfico  de dispersão: plot
#####
plot(estudantes$Horas_de_Estudo, estudantes$Nota_em_Matematica) # por padrão, variavel que representa o eixo x primeiro

# argumentos:
# main: título principal do gráfico
# xlab: rótulo do eixo x
# ylab: rótulo do eixo y
plot(estudantes$Horas_de_Estudo, estudantes$Nota_em_Matematica,
     main = "Gráfico de Dispersão: Horas de Estudo vs. Nota em Matemática",
     xlab = "Horas de Estudo",
     ylab = "Notas em Matemática")

# xlim e ylim: define o limite para os eixos x e y (inicio, fim)
plot(estudantes$Horas_de_Estudo, estudantes$Nota_em_Matematica,
     main = "Gráfico de Dispersão: Horas de Estudo vs. Nota em Matemática",
     xlab = "Horas de Estudo",
     ylab = "Notas em Matemática",
     xlim = c(0, 5), 
     ylim = c(0, 10))

# col: define a cor dos pontos
plot(estudantes$Horas_de_Estudo, estudantes$Nota_em_Matematica,
     main = "Gráfico de Dispersão: Horas de Estudo vs. Nota em Matemática",
     xlab = "Horas de Estudo",
     ylab = "Notas em Matemática",
     xlim = c(0, 5), 
     ylim = c(0, 10),
     col = "red")

# pch: define o simbolo usado para os pontos (pode ser letras)
plot(estudantes$Horas_de_Estudo, estudantes$Nota_em_Matematica,
     main = "Gráfico de Dispersão: Horas de Estudo vs. Nota em Matemática",
     xlab = "Horas de Estudo",
     ylab = "Notas em Matemática",
     xlim = c(0, 5), 
     ylim = c(0, 10),
     col = "red",
     pch = 9)

#cex: define o tamanho do simbolo
plot(estudantes$Horas_de_Estudo, estudantes$Nota_em_Matematica,
     main = "Gráfico de Dispersão: Horas de Estudo vs. Nota em Matemática",
     xlab = "Horas de Estudo",
     ylab = "Notas em Matemática",
     xlim = c(0, 5), 
     ylim = c(0, 10),
     col = "red",
     pch = 7,
     cex = 2)

# grid: define as linhas de grade
grid()
grid(col = "blue", lty = 3, lwd = 0.8) # personalizando o grid

# Adicionando linhas de referencia no grid (linha de regressão)
abline(lm(Nota_em_Matematica ~ Horas_de_Estudo, data = estudantes), col = "black")



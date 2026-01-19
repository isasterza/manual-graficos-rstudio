# ===============================================================
# SCRIPT: graficos_ggplot.R
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
library(ggplot2)
library(RColorBrewer)

### EXPORTAR DADOS ###

estudantes <- read_csv("estudantes.csv")
estudantes_tarefas <- read_csv("estudantes_tarefas_media.csv")

### CONHECENDO A BASE DE DADOS ###

View(estudantes)
str(estudantes)
ncol(estudantes)
nrow(estudantes)
colnames(estudantes)


# Estrutura básica do ggplot
# ggplot (data = df, aes(x = <variável_x> , y = <variável_y> )) + quais variaveis estarão no gráfico
#   tipo_grafico() + (geom_bar, geom_histogram, geom_line, geom_point)
#   labs(title = , x = , y = ) + quais são os rótulos que deseja mostrar nas variáveis


#####
# Gráfico de barras
#####
ggplot(data = estudantes, aes(x = factor(Idade))) +
  geom_bar()

# Inserindo rótulos
ggplot(data = estudantes, aes(x = factor(Idade))) +
  geom_bar() +
  labs(title = "Distribuição dos alunos por Idade",
       x = "Idade",
       y = "Frequência")

# Deixando o gráfico visualmente mais leve (theme_minimal deixo o eixo cartesiano mais simples, theme_void deixa tudo em branco)
ggplot(data = estudantes, aes(x = factor(Idade))) +
  geom_bar() +
  labs(title = "Distribuição dos alunos por Idade",
       x = "Idade",
       y = "Frequência") +
  theme_minimal()

# width: Ajusta a largura das barras
ggplot(data = estudantes, aes(x = factor(Idade))) +
  geom_bar(width = 0.5) +
  labs(title = "Distribuição dos alunos por Idade",
       x = "Idade",
       y = "Frequência") +
  theme_minimal()

# xlim e ylim: define o limite para os eixos x e y (inicio, fim)
ggplot(data = estudantes, aes(x = factor(Idade))) +
  geom_bar(width = 0.5) +
  labs(title = "Distribuição dos alunos por Idade",
       x = "Idade",
       y = "Frequência") +
  theme_minimal() +
  ylim(0, max(table(estudantes$Idade)) + 5) #Define que a altura do eixo y é o maximo + 5 unidades

# fill: define a cor do gráfico - quando você pinta por categoria, diferenciando as cores, o ggplot gera legenda

# aplicar a cor em cada categoria, mapeando a váriavel - aes
ggplot(data = estudantes, aes(x = factor(Idade), fill = factor(Idade))) +
  geom_bar(width = 0.5) +
  labs(title = "Distribuição dos alunos por Idade",
       x = "Idade",
       y = "Frequência") +
  theme_minimal() +
  ylim(0, max(table(estudantes$Idade)) + 5)

# aplicar a cor geral no gráfico - geom_bar
ggplot(data = estudantes, aes(x = factor(Idade))) +
  geom_bar(width = 0.5, fill = "darkgreen") +
  labs(title = "Distribuição dos alunos por Idade",
       x = "Idade",
       y = "Frequência") +
  theme_minimal() +
  ylim(0, max(table(estudantes$Idade)) + 5)

# fill + scale_fill_manual: escolher uma paleta de cores de forma manual 
ggplot(data = estudantes, aes(x = factor(Idade), fill = factor(Idade))) +
  geom_bar(width = 0.5) +
  scale_fill_manual(values = c("11" = "red", "12" = "blue", "13" = "green")) +
  labs(title = "Distribuição dos alunos por Idade",
       x = "Idade",
       y = "Frequência") +
  theme_minimal() +
  ylim(0, max(table(estudantes$Idade)) + 5)

# fill + scale_fill_brewer: escolher uma paleta de cores pré-definida com o pacote RColorBrewer (ver ?RColorBrewer)
ggplot(data = estudantes, aes(x = factor(Idade), fill = factor(Idade))) +
  geom_bar(width = 0.5) +
  scale_fill_brewer(palette = "Set2") +
  labs(title = "Distribuição dos alunos por Idade",
       x = "Idade",
       y = "Frequência") +
  theme_minimal() +
  ylim(0, max(table(estudantes$Idade)) + 5)

# color: define as bordas das barras
ggplot(data = estudantes, aes(x = factor(Idade), fill = factor(Idade))) +
  geom_bar(width = 0.5, color = "black") +
  labs(title = "Distribuição dos alunos por Idade",
       x = "Idade",
       y = "Frequência") +
  theme_minimal() +
  ylim(0, max(table(estudantes$Idade)) + 5)

# legenda: vem automatica mas pode ser editada
# scale_fill_manual(quando ja usado) ou scale_fill_discrete (labels = c("variavel_1", "variavel_2")) editar os rótulos de cada categoria
ggplot(data = estudantes, aes(x = factor(Idade), fill = factor(Idade))) +
  geom_bar(width = 0.5, color = "black") +
  scale_fill_discrete(labels = c("11 anos", "12 anos", "13 anos", "14 anos", "15 anos")) +
  labs(title = "Distribuição dos alunos por Idade",
       x = "Idade",
       y = "Frequência") +
  theme_minimal() +
  ylim(0, max(table(estudantes$Idade)) + 5)

# labs (fill = "Titulo da Legenga")
ggplot(data = estudantes, aes(x = factor(Idade), fill = factor(Idade))) +
  geom_bar(width = 0.5, color = "black") +
  scale_fill_discrete(labels = c("11 anos", "12 anos", "13 anos", "14 anos", "15 anos")) +
  labs(title = "Distribuição dos alunos por Idade",
       x = "Idade",
       y = "Frequência",
       fill = "Idades dos Alunos") +
  theme_minimal() +
  ylim(0, max(table(estudantes$Idade)) + 5)

# geom_text: Adicionar o valor das frequências e outros textos
# aes(label =   after_stat(count)): substitui pelos valores da contagem
# stat: qual é o tipo de método estatistico aplicando (nesse caso contagem - count)
# vjust: define a posição (por padrão o valor fica na metade da linha superior do gráfico)
ggplot(data = estudantes, aes(x = factor(Idade), fill = factor(Idade))) +
  geom_bar(width = 0.5, color = "black") +
  geom_text(aes(label =   after_stat(count)), stat = "count", vjust = -0.5) +
  scale_fill_discrete(labels = c("11 anos", "12 anos", "13 anos", "14 anos", "15 anos")) +
  labs(title = "Distribuição dos alunos por Idade",
       x = "Idade",
       y = "Frequência",
       fill = "Idades dos Alunos") +
  theme_minimal() +
  ylim(0, max(table(estudantes$Idade)) + 5)

# theme: Modificar elementos do gráfico
# axis.text.x: Controla o texto do eixo X (categorias das barras)
# element_blank(): Remove o elemento do gráfico
ggplot(data = estudantes, aes(x = factor(Idade), fill = factor(Idade))) +
  geom_bar(width = 0.5, color = "black") +
  geom_text(aes(label =   after_stat(count)), stat = "count", vjust = -0.5) +
  scale_fill_discrete(labels = c("11 anos", "12 anos", "13 anos", "14 anos", "15 anos")) +
  labs(title = "Distribuição dos alunos por Idade",
       x = "Idade",
       y = "Frequência",
       fill = "Idades dos Alunos") +
  theme_minimal() +
  theme(axis.text.x = element_blank()) +
  ylim(0, max(table(estudantes$Idade)) + 5)


# No geom_bar podemos usar vários argumentos que vão ajustar o gráfico de barras

# Distribuição de Presenças por Sexo (empilhadas)
ggplot(estudantes, aes(x = factor(Presencas), fill = factor(Sexo))) +
  geom_bar(position = "stack", width = 0.5) +
  labs(title = "Distribuição de Frequência por Sexo",
       x = "Frequência",
       y = "Contagem",
       fill = "Sexo")

# Distribuição de Presenças por Sexo (justapostas)
ggplot(estudantes, aes(x = factor(Presencas), fill = factor(Sexo))) +
  geom_bar(position = "dodge", width = 0.5) +
  labs(title = "Distribuição de Frequência por Sexo",
       x = "Frequência",
       y = "Contagem",
       fill = "Sexo")

# Proporção de Presenças por Sexo (proporcionais)
ggplot(estudantes, aes(x = factor(Presencas), fill = factor(Sexo))) +
  geom_bar(position = "fill", width = 0.5) +
  labs(title = "Proporção de Frequência por Sexo",
       x = "Frequência",
       y = "Proporção",
       fill = "Sexo")

# #####
# # Gráfico de setores: geom_bar + coord_polar
# #####
# 
# # O gráfico de setores é um gráfico de barras com coordenadas polares.
# # Então repetimos os parâmetros. 
# # A coordenada polar deve ser em relação a altura do grafico de barras (contagem). Por isso é usado o y
 # fill: define a cor do gráfico - quando você pinta por categoria, diferenciando as cores, o ggplot gera legenda
 # aplicar a cor em cada categoria, mapeando a váriavel - aes
ggplot(data = estudantes, aes(x = ""), fill = factor(Serie)) +
   geom_bar(width = 1) +  
   coord_polar(theta = "y") + 
   theme_void()

ggplot(data = estudantes, aes(x = ""), fill = factor(Serie)) +
  geom_bar(width = 1) +  
  coord_polar(theta = "y") + 
  labs(title = "Distribuição de Alunos por Série Escolar", x = NULL, y = NULL) +
  theme_void()

# # Aplicar uma cor só no gráfico não faz sentido, como vimos anteriormente
# # fill + scale_fill_manual: escolher uma paleta de cores de forma manual 
# nesse caso, ja adaptamos a legenda junto com as cores para ficar mais facil
ggplot(data = estudantes, aes(x = "", fill = factor(Serie))) +
  geom_bar(width = 1) +  
  coord_polar(theta = "y") + 
  scale_fill_manual(values = c("6 ano" = "red", "7 ano" = "blue", "8 ano" = "green")) +
  labs(title = "Distribuição de Alunos por Série Escolar", x = NULL, y = NULL) +
  theme_void()

# # fill + scale_fill_brewer: escolher uma paleta de cores pré-definida com o pacote RColorBrewer (ver ?RColorBrewer)
ggplot(data = estudantes, aes(x = "", fill = factor(Serie))) +
  geom_bar(width = 1) +  
  coord_polar(theta = "y") + 
   scale_fill_brewer(palette = "Set2") +
  labs(title = "Distribuição de Alunos por Série Escolar", x = NULL, y = NULL) +
  theme_void()
# 
# # color: define as bordas das barras
ggplot(data = estudantes, aes(x = "", fill = factor(Serie))) +
  geom_bar(width = 1, color = "black") +  
  coord_polar(theta = "y") + 
  scale_fill_brewer(palette = "Set2") +
  labs(title = "Distribuição de Alunos por Série Escolar", x = NULL, y = NULL) +
  theme_void()


# # labs (fill = "Titulo da Legenga")
ggplot(data = estudantes, aes(x = "", fill = factor(Serie))) +
  geom_bar(width = 1, color = "black") +  
  coord_polar(theta = "y") + 
  scale_fill_brewer(palette = "Set2") +
  labs(title = "Distribuição de Alunos por Série Escolar", x = NULL, y = NULL, fill = "Série Escolar") +
  theme_void()

#
# # geom_text: Adicionar o valor das frequências e outros textos
# # aes(label =   after_stat(count)): substitui pelos valores da contagem
# # stat: qual é o tipo de método estatistico aplicando (nesse caso contagem - count)
# # vjust: define a posição (por padrão o valor fica na metade da linha superior do gráfico)
# 
ggplot(estudantes, aes(x = "", fill = factor(Serie))) +
  geom_bar(width = 1, color = "white") +
  coord_polar(theta = "y") +
  scale_fill_brewer(palette = "Set2") +
  geom_text(
    aes(label = after_stat(count)),
    stat = "count",
    position = position_stack(vjust = 0.5),
    color = "black"
  ) +
  labs(
    title = "Distribuição de Alunos por Série Escolar",
    fill = "Série Escolar",
    x = NULL, y = NULL
  ) +
  theme_void()



# # Mostrando a porcentagem
ggplot(estudantes, aes(x = "", fill = factor(Serie))) +
  geom_bar(width = 1, color = "white") +
  coord_polar(theta = "y") +
  scale_fill_brewer(palette = "Set2") +
  geom_text(
    aes(label = paste0(round(..count.. / sum(..count..) * 100, 1), "%")),
    stat = "count",
    position = position_stack(vjust = 0.5),
    color = "black"
  ) +
  labs(
    title = "Distribuição de Alunos por Série Escolar",
    fill = "Série Escolar",
    x = NULL, y = NULL
  ) +
  theme_void()


#####
# Histograma: geom_histogram
#####

# O histograma depende dos intervalos.
# geom_histogram(binwidth = <largura_intervalo> ou bins = <quant_intervalos>)
ggplot(data = estudantes, aes(x = Nota_em_Matematica)) +
  geom_histogram(binwidth = 2)

ggplot(data = estudantes, aes(x = Nota_em_Matematica)) +
  geom_histogram(bins = 9)

# Inserindo rótulos
ggplot(data = estudantes, aes(x = Nota_em_Matematica)) +
  geom_histogram(bins = 9) +
  labs(title = "Distribuição das Notas em Matemática", 
       x = "Nota em Matemática", 
       y = "Frequência")

# Deixando o gráfico visualmente mais leve (theme_minimal deixo o eixo cartesiano mais simples, theme_void deixa tudo em branco)
ggplot(data = estudantes, aes(x = Nota_em_Matematica)) +
  geom_histogram(bins = 9) +
  labs(title = "Distribuição das Notas em Matemática", 
       x = "Nota em Matemática", 
       y = "Frequência") +
  theme_minimal()

# fill: define a cor do gráfico 

# aplicar a cor geral no gráfico - geom_histogram
ggplot(data = estudantes, aes(x = Nota_em_Matematica)) +
  geom_histogram(bins = 9, fill = "blue") +
  labs(title = "Distribuição das Notas em Matemática", 
       x = "Nota em Matemática", 
       y = "Frequência") +
  theme_minimal()

# scale_fill_gradient: aplicar uma cor gradiente pela quantidade de elementos em cada intervalo 
ggplot(data = estudantes, aes(x = Nota_em_Matematica)) +
  geom_histogram(bins = 9, aes(fill =after_stat(count))) +
  scale_fill_gradient(low = "blue", high = "red") +
  labs(title = "Distribuição das Notas em Matemática", 
       x = "Nota em Matemática", 
       y = "Frequência") +
  theme_minimal()


# color: define as bordas das barras
ggplot(data = estudantes, aes(x = Nota_em_Matematica)) +
  geom_histogram(bins = 9, fill = "blue", color = "black") +
  labs(title = "Distribuição das Notas em Matemática", 
       x = "Nota em Matemática", 
       y = "Frequência") +
  theme_minimal()

ggplot(data = estudantes, aes(x = Nota_em_Matematica)) +
  geom_histogram(bins = 9, aes(fill =after_stat(count)), color = "black") +
  scale_fill_gradient(low = "blue", high = "red") +
  labs(title = "Distribuição das Notas em Matemática", 
       x = "Nota em Matemática", 
       y = "Frequência") +
  theme_minimal()

# legenda: no caso do histograma faz sentido apenas para a coloração em gradiente
ggplot(data = estudantes, aes(x = Nota_em_Matematica)) +
  geom_histogram(bins = 9, aes(fill =after_stat(count)), color = "black") +
  scale_fill_gradient(low = "blue", high = "red", name = "Frequência") +
  labs(title = "Distribuição das Notas em Matemática", 
       x = "Nota em Matemática", 
       y = "Frequência") +
  theme_minimal()


#####
# GRÁFICO DE LINHAS: geom_line
#####
# O gráfico de linhas precisa de x e y 

ggplot(data = estudantes_tarefas, aes(x = Semana, y = Nota)) +
  geom_line() 

# Inserindo rótulos
ggplot(data = estudantes_tarefas, aes(x = Semana, y = Nota)) +
  geom_line()  +
  labs(title = "Distribuição de Notas de Tarefas por Semana", 
       x = "Semana", 
       y = "Média das Notas")

# Deixando o gráfico visualmente mais leve (theme_minimal deixo o eixo cartesiano mais simples, theme_void deixa tudo em branco)
ggplot(data = estudantes_tarefas, aes(x = Semana, y = Nota)) +
  geom_line()  +
  labs(title = "Distribuição de Notas de Tarefas por Semana", 
       x = "Semana", 
       y = "Média das Notas") +
  theme_minimal()

# Definindo limites de x e y:
ggplot(data = estudantes_tarefas, aes(x = Semana, y = Nota)) +
  geom_line()  +
  labs(title = "Distribuição de Notas de Tarefas por Semana", 
       x = "Semana", 
       y = "Média das Notas") +
  coord_cartesian(ylim = c(min(estudantes_tarefas$Nota) -1, max(estudantes_tarefas$Nota) + 1)) +
  theme_minimal()


# color: define a cor da linha
ggplot(data = estudantes_tarefas, aes(x = Semana, y = Nota)) +
  geom_line(color = "red")  +
  labs(title = "Distribuição de Notas de Tarefas por Semana", 
       x = "Semana", 
       y = "Média das Notas") +
  coord_cartesian(ylim = c(min(estudantes_tarefas$Nota) -1, max(estudantes_tarefas$Nota) + 1)) +
  theme_minimal()

# size: define a largura da linha 
ggplot(data = estudantes_tarefas, aes(x = Semana, y = Nota)) +
  geom_line(color = "red", size = 1)  +
  labs(title = "Distribuição de Notas de Tarefas por Semana", 
       x = "Semana", 
       y = "Média das Notas") +
  coord_cartesian(ylim = c(min(estudantes_tarefas$Nota) -1, max(estudantes_tarefas$Nota) + 1)) +
  theme_minimal()

# linetype: define o tipo de linha
# 0 = blank (em branco), 1 = solid (solida), 2 = dashed (tracejada), 3 = dotted (pontilhada), 
# 4 = dotdash (ponto e traço), 5 = longdash (traço longo), 6 = twodash (dois traços)
ggplot(data = estudantes_tarefas, aes(x = Semana, y = Nota)) +
  geom_line(color = "red", size = 1, linetype = "dotted")  +
  labs(title = "Distribuição de Notas de Tarefas por Semana", 
       x = "Semana", 
       y = "Média das Notas") +
  coord_cartesian(ylim = c(min(estudantes_tarefas$Nota) -1, max(estudantes_tarefas$Nota) + 1)) +
  theme_minimal()

# Adicionando linhas de referencia no grid
# geom_hline é uma linha horizontal, utilizando os outros parâmetros ja conhecidos de linhas
ggplot(data = estudantes_tarefas, aes(x = Semana, y = Nota)) +
  geom_line(color = "black") +
  geom_hline(yintercept = min(estudantes_tarefas$Nota), 
             color = "red", linetype = "dashed", size = 1) +
  geom_hline(yintercept = mean(estudantes_tarefas$Nota), 
             color = "green", linetype = "dashed", size = 1) +
  geom_hline(yintercept = max(estudantes_tarefas$Nota), 
             color = "blue", linetype = "dashed", size = 1) +
  labs(title = "Distribuição de Notas de Tarefas por Semana", 
       x = "Semana", 
       y = "Média das Notas") +
  coord_cartesian(ylim = c(min(estudantes_tarefas$Nota) -1, max(estudantes_tarefas$Nota) + 1)) +
  theme_minimal()

ggplot(data = estudantes_tarefas, aes(x = Semana, y = Nota)) +
  geom_line(color = "black") +
  geom_hline(yintercept = 7, 
             color = "red", linetype = "dashed", size = 1) +
  labs(title = "Distribuição de Notas de Tarefas por Semana", 
       x = "Semana", 
       y = "Média das Notas") +
  coord_cartesian(ylim = c(min(estudantes_tarefas$Nota) -1, max(estudantes_tarefas$Nota) + 1)) +
  theme_minimal()

#####
# Gráfico  de dispersão: geom_point
#####
ggplot(data = estudantes, aes(x = Horas_de_Estudo, y = Nota_em_Matematica)) +
  geom_point()

# Inserindo rótulos
ggplot(data = estudantes, aes(x = Horas_de_Estudo, y = Nota_em_Matematica)) +
  geom_point() +
  labs(title = "Gráfico de Dispersão: Horas de Estudo vs. Nota em Matemática",
       x = "Horas de Estudo",
       y = "Notas em Matemática") 

# Deixando o gráfico visualmente mais leve
ggplot(data = estudantes, aes(x = Horas_de_Estudo, y = Nota_em_Matematica)) +
  geom_point() +
  labs(title = "Gráfico de Dispersão: Horas de Estudo vs. Nota em Matemática",
       x = "Horas de Estudo",
       y = "Notas em Matemática") +
  theme_minimal()

# xlim e ylim: define o limite para os eixos x e y (inicio, fim)
ggplot(data = estudantes, aes(x = Horas_de_Estudo, y = Nota_em_Matematica)) +
  geom_point() +
  labs(title = "Gráfico de Dispersão: Horas de Estudo vs. Nota em Matemática",
       x = "Horas de Estudo",
       y = "Notas em Matemática") +
  coord_cartesian(xlim = c(min(estudantes$Horas_de_Estudo), 5), ylim = c(0, 10)) +
  theme_minimal()

# color: define a cor dos pontos
ggplot(data = estudantes, aes(x = Horas_de_Estudo, y = Nota_em_Matematica)) +
  geom_point(color = "red") +
  labs(title = "Gráfico de Dispersão: Horas de Estudo vs. Nota em Matemática",
       x = "Horas de Estudo",
       y = "Notas em Matemática") +
  coord_cartesian(xlim = c(min(estudantes$Horas_de_Estudo), 5), ylim = c(0, 10)) +
  theme_minimal()

# shape: define o simbolo usado para os pontos (pode ser letras)

ggplot(data = estudantes, aes(x = Horas_de_Estudo, y = Nota_em_Matematica)) +
  geom_point(color = "red", shape = 7) +
  labs(title = "Gráfico de Dispersão: Horas de Estudo vs. Nota em Matemática",
       x = "Horas de Estudo",
       y = "Notas em Matemática") +
  coord_cartesian(xlim = c(min(estudantes$Horas_de_Estudo), 5), ylim = c(0, 10)) +
  theme_minimal()


#size: define o tamanho do simbolo
ggplot(data = estudantes, aes(x = Horas_de_Estudo, y = Nota_em_Matematica)) +
  geom_point(color = "red", shape = 7, size = 3) +
  labs(title = "Gráfico de Dispersão: Horas de Estudo vs. Nota em Matemática",
       x = "Horas de Estudo",
       y = "Notas em Matemática") +
  coord_cartesian(xlim = c(min(estudantes$Horas_de_Estudo), 5), ylim = c(0, 10)) +
  theme_minimal()

# Adicionando linhas de referencia no grid (linha de regressão)
# method = lm (linear method - regressao linear). 
# se: áre de incerteza da linha - FALSE PARA TIRAR
ggplot(data = estudantes, aes(x = Horas_de_Estudo, y = Nota_em_Matematica)) +
  geom_point(color = "red", shape = 7, size = 3) +
  geom_smooth(method = "lm", color = "black", se = FALSE) +
  labs(title = "Gráfico de Dispersão: Horas de Estudo vs. Nota em Matemática",
       x = "Horas de Estudo",
       y = "Notas em Matemática") +
  coord_cartesian(xlim = c(min(estudantes$Horas_de_Estudo), 5), ylim = c(0, 10)) +
  theme_minimal()

ggplot(data = estudantes, aes(x = Horas_de_Estudo, y = Nota_em_Matematica)) +
  geom_point(color = "red", shape = 7, size = 3) +
  geom_smooth(method = "lm", color = "black", se =TRUE) +
  labs(title = "Gráfico de Dispersão: Horas de Estudo vs. Nota em Matemática",
       x = "Horas de Estudo",
       y = "Notas em Matemática") +
  coord_cartesian(xlim = c(min(estudantes$Horas_de_Estudo), 5), ylim = c(0, 10)) +
  theme_minimal()

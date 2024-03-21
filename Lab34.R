#Alumna: Alejandra Guzmán Dimas
#PRETTYHEATMAP EN R

#Prerrequisitos: Instalar paquetería "pheatmap"
install.packages("pheatmap")

#Llamar a la biblioteca "pheatmap"
library(pheatmap)

#Importar datos
file.choose()

#Convertir primer archivo a  matriz
genes=as.matrix(
  read.csv("/Users/alejandraguzmandimas/Desktop/heatmap_data.csv",
           sep=",",
           header=T,
           row.names = 1))

#Importar tercer archivo (columnas)
annotation_col=read.csv("/Users/alejandraguzmandimas/Desktop/annotation_col.csv", header=T, row.names = 1)

#Importar segundo archivo (filas)
annotation_rows=read.csv("/Users/alejandraguzmandimas/Desktop/annotation_row.csv", header=T, row.names = 1)

#Dibujar nuestro heatmap
pheatmap(genes)

#Darle formato
#Cambiar tipo de fuente
pheatmap(genes, frontsize=6)

#Quitar uno de los dendogramas (pacientes)
pheatmap(genes, frontsize=8, cluster_rows=T, cluster_cols = F)

#Quitar uno de los dendogramas (vertical)
pheatmap(genes, frontsize=8, cluster_rows=F, cluster_cols = T)

#Ver ambos dendogramas
pheatmap(genes, frontsize=8, cluster_rows=T, cluster_cols = T)

#Ver si hay patrones subyacentes a las anotaciones de las columnas o renglones
pheatmap(genes, frontsize=6, cluster_rows=T, cluster_cols = T, annotation_row = annotation_rows)

#Añadir las anotaciones en las columnas
pheatmap(genes, frontsize=6, cluster_rows=T, cluster_cols = T, annotation_row = annotation_rows, annotation_col=annotation_col)

#Generar gráfico completo
pheatmap(genes, frontsize=6, cluster_rows=T, cluster_cols = T, annotation_row = annotation_rows, annotation_col=annotation_col, treeheight_row = 0, treeheight_col = 0, main="Expresión genética")

#Tomar una muestra de la base general (subset)
sub=genes[c(1:5, 55:60), c(1:5,20:35, 55:60)]

#Generar mapa de calor del subconjunto llamado "sub"
pheatmap(sub, frontsize=6, cluster_rows=T, cluster_cols = T, annotation_row = annotation_rows, annotation_col=annotation_col, treeheight_row = 0, treeheight_col = 0, main="Expresión genética")

#Desplegar valores con "sub"
pheatmap(sub, frontsize=6, cluster_rows=T, cluster_cols = T, annotation_row = annotation_rows, annotation_col=annotation_col, treeheight_row = 0, treeheight_col = 0, main="Expresión genética", fontsize = 8, annotation_legend = FALSE, display_numbers = T, fontsize_number = 6)

#Instalar paquetería "viridis"
install.packages("viridis")

#Llamar a la biblioteca "viridis"
library(viridis)

#Ocupar paletas para visualizar cómo cambia nuestro mapa de calor
pheatmap(sub, frontsize=6, cluster_rows=T, cluster_cols = T, annotation_row = annotation_rows, annotation_col=annotation_col, treeheight_row = 0, treeheight_col = 0, main="Expresión genética", fontsize = 8, annotation_legend = FALSE, display_numbers = T, fontsize_number = 6, col=viridis_pal(option= "plasma")(6))

pheatmap(sub, frontsize=6, cluster_rows=T, cluster_cols = T, annotation_row = annotation_rows, annotation_col=annotation_col, treeheight_row = 0, treeheight_col = 0, main="Expresión genética", fontsize = 8, annotation_legend = FALSE, display_numbers = T, fontsize_number = 6, col=viridis_pal(option= "magma")(6))

pheatmap(sub, frontsize=6, cluster_rows=T, cluster_cols = T, annotation_row = annotation_rows, annotation_col=annotation_col, treeheight_row = 0, treeheight_col = 0, main="Expresión genética", fontsize = 8, annotation_legend = FALSE, display_numbers = T, fontsize_number = 6, col=viridis_pal(option= "viridis")(6))

pheatmap(sub, frontsize=6, cluster_rows=T, cluster_cols = T, annotation_row = annotation_rows, annotation_col=annotation_col, treeheight_row = 0, treeheight_col = 0, main="Expresión genética", fontsize = 8, annotation_legend = FALSE, display_numbers = T, fontsize_number = 6, col=viridis_pal(option= "cividis")(6))

pheatmap(sub, frontsize=6, cluster_rows=T, cluster_cols = T, annotation_row = annotation_rows, annotation_col=annotation_col, treeheight_row = 0, treeheight_col = 0, main="Expresión genética", fontsize = 8, annotation_legend = FALSE, display_numbers = T, fontsize_number = 6, col=viridis_pal(option= "inferno")(6))


#Elementos adicionales
#Identificar distancias entre genes
dist(sub)

#Identificar el mapa de calor de la correlación de datos
pheatmap(cor(sub))

#Identificar el mapa de calor de la correlación de los genes

#Matriz transpuesta
trans=t(sub)

#Correlación de la matriz transpuesta
pheatmap(cor(trans))
pheatmap(cor(sub))
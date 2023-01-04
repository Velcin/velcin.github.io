# code réalisé par Julien Velcin
# pour le cours de Deep Learning
# M2 Data Mining - Université Lyon 2
# 2019-2020

library(sigmoid)

# 4 entrées possibles pour le XOR (attention, il y a l'entrée "1" du biais en colonne 1)
data <- matrix(c(1,1,1,1,1,0,1,0,1,1,0,0), nrow = 4, ncol = 3, byrow=TRUE)
n_ex <- dim(data)[1]
colnames(data) <- c("b", "x1", "x2")

# 4 classes associées (il suffit de les changer pour modéliser d'autres fonctions logiques)
labels <- c(0,1,1,0)
#labels <- c(0,1,1,1)
#labels <- c(1,0,0,0)

# architecture du réseau
n_input <- dim(data)[2] - 1 # -1 à cause de l'entrée x_0 associée au biais w_0
n_hidden_layer <- 2
n_output <- 1 # problème binaire

# deux matrices de poids :
# - w.i.h : poids de la couche d'entrée à la couche cachée
# - w.h.o : poids de la couche cachée à la couche de sortie
# on les initialise de manière aléatoire à l'aide d'une normale
w.i.h <- matrix(rnorm((n_input+1) * n_hidden_layer, mean=0, sd=1), n_input+1, n_hidden_layer)
w.h.o <- matrix(rnorm((n_hidden_layer+1) * n_output, mean=0, sd=1), n_hidden_layer+1, n_output)

# pas d'apprentissage
lambda <- 0.1

# calcule la sortie du réseau pour l'ensemble des données
# retourne également les sorties intermédiaires, indispensable pour la phase d'apprentissage
forward <- function(d, w.i.h, w.h.o) {
  s_hidden <- d %*% w.i.h
  y_hidden <- sigmoid(s_hidden) 
  y_hidden <- cbind(c(1,1,1,1), y_hidden)
  s_predict <- y_hidden %*% w.h.o
  y_predict <- sigmoid(s_predict)
  return(list(y_hidden, y_predict))
}

# une passe d'apprentissage par rétropropagation sur toutes les données (mode "batch")
onepass <- function(d, w.i.h, w.h.o) {
  
  # 1) on calcule la sortie de toutes les couches du réseau
  r <- forward(d, w.i.h, w.h.o)
  y_hidden <- r[[1]]
  y_predict <- r[[2]]
  
  # 2) on calcule le gradient \delta_k du cours pour chaque neurone de sortie (ici 1)
  delta_out <- y_predict * (1-y_predict) * (labels - y_predict)
  
  # 3) on calcule de \Delta_w pour chacun des poids w_jk entre la couche cachée et la couche de sortie
  #    et on met à jour ces poids
  for (k in 1:n_output)
    for (j in 1:(n_hidden_layer+1)) 
      for (e in 1:n_ex) { # on le fait pour chaque exemple (un apply pourrait être plus élégant)
        delta.w.h.o <- lambda * delta_out[e, k] * y_hidden[e, j]
        w.h.o[j, k] <- w.h.o[j, k] + delta.w.h.o
      }
  
  # 4) on calcule le gradient \delta_j pour les neurones intermédiaire, à partir du gradient
  #    de sortie et des poids w_jk (combinaison linéaire)
  delta_hidden <- matrix(ncol=n_hidden_layer, nrow=n_ex)
  for (j in 1:n_hidden_layer) {
    for (e in 1:n_ex) {
      error <- 0
      for (k in 1:n_output)
        error <- error + delta_out[e, k] * w.h.o[j+1, k]
      delta_hidden[e, j] <- y_hidden[e, j+1] * (1-y_hidden[e, j+1]) * error
    }
  }
  
  # 5) même étape que 3 mais avec \delta_j et x_i
  for (j in 1:n_hidden_layer)
    for (i in 1:(n_input+1)) 
      for (e in 1:n_ex) {
        delta.w.i.h <- lambda * delta_hidden[e, j] * d[e, i]
        w.i.h[i, j] <- w.i.h[i, j] + delta.w.i.h
      }
  
  return(list(w.i.h, w.h.o))
}

# c'est parti, on peut apprendre sur un nombre choisi d'itérations
for (iter in 1:5000) {
  r <- onepass(data, w.i.h, w.h.o)
  w.i.h <- r[[1]]
  w.h.o <- r[[2]]
}

# et afficher le résultat
r <- forward(data, w.i.h, w.h.o)
r[[2]]

# très instructif : afficher les résultats dans l'espace continu
range <- seq(0,1,0.05)
#range <- seq(-2,2,0.05)
len.range <- length(range)
data.continues <- matrix(ncol=3, nrow=(len.range**2))
ind <- 1
for (i in range)
  for (j in range) {
    data.continues[ind, ] <- c(1, i, j)
    r <- forward(data.continues, w.i.h, w.h.o)
    y_predict <- r[[2]]
    data.continues.label = 1*(y_predict>0.5)
    ind <- ind+1
  }

plot(data.continues[,2], data.continues[,3], col=data.continues.label+1)

# et se rendre compte que, parfois, l'apprentissage échoue !
    
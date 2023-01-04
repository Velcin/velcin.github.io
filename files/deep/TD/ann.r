#### préparation des données

# lecture des données
data <- read.csv("data.csv", header=T, sep="\t")

# on n'oublie pas de rajouter le "1" pour le poids w0 (biais), qui ici correspond aux seuils théta
data.augmented <- cbind(bias=1, data)

# construction de la matrice des poids W
w.n1 <- c(0.1, -0.4, 0.1, -0.6)
w.n2 <- c(0, 0.1, -0.1, 0.2)
w.n3 <- c(-0.3, 0.5, -0.1, 0.4)
weights <- cbind(w.n1, w.n2, w.n3)

# on utilise un objet de type "matrix" dans R pour les calculs
input <- as.matrix(data.augmented[,1:4])

#### calcul de la sortie du réseau pour les 7 exemples (feed forward)

# on peut calculer neurone par neurone
#out.n1 <- as.numeric((input %*% w.n1) > 0)
#out.n2 <- as.numeric((input %*% w.n2) > 0)
#out.n3 <- as.numeric((input %*% w.n3) > 0)

# ou alors directement :
out <- input %*% weights
1*(out > 0)

# si on calcule l'erreur (approche pessimiste), trouve 3/7

#### apprentissage : on cherche à améliorer les poids
# ici, on se place dans le cas où on modifie W après chaque *exemple*
# (gradient stochastique avec une taille de mini-batch de 1)

# voilà les sorties attendues pour les trois neurones :
#   classe 1 = sorties [1 0 0]
#   classe 2 = sorties [0 1 0]
#   classe 3 = sorties [0 0 1]

# pas d'apprentissage
lambda <- 0.1

# les exemples 1 et 2 sont correctement classés, pas de changement dans les poids

# exemple 3 prédit 2 (approche pessimiste) au lieu de 3
# c'est la sortie du neurone 2 qui est fautive, il faut mettre à jour les poids (ici les diminuer)
#   ici x_i = e_3 = input[3,]
#       erreur = (y - y^) = (0 - 1)
delta.w.n2 <- lambda * input[3,] * (0 - 1)
w.n2 <- w.n2 + delta.w.n2

# on reconstruit la matrice de poids W
weights <- cbind(w.n1, w.n2, w.n3)
# et on relancer les calculs
out <- input %*% weights
1*(out > 0)

# nouveau probléme avec l'exemple 4 où le neurone 2 prédit 0 au lieu de 1
# (il faut augmenter les poids pour n2)
delta.w <- lambda * input[4,] * (1 - 0)
w.n2 <- w.n2 + delta.w

# rebelote : on recalcule tout
weights <- cbind(w.n1, w.n2, w.n3)
out <- input %*% weights
1*(out > 0)

# problème avec l'exemple 6
delta.w <- lambda * input[6,] * (0 - 1)
w.n2 <- w.n2 + delta.w
weights <- cbind(w.n1, w.n2, w.n3)
  out <- input %*% weights
1*(out > 0)

# l'exemple 7 soulève deux problèmes : n2 sort 0 au lieu de 1 et n3 sort 1 au lieu de 0
# il faut donc corriger les poids qui mènent vers ces deux neurones
delta.w <- lambda * input[7,] * (1 - 0)
w.n2 <- w.n2 + delta.w
delta.w.3 <- lambda * input[7,] * (0 - 1)
w.n3 <- w.n3 + delta.w.3
weights <- cbind(w.n1, w.n2, w.n3)
out <- input %*% weights
1*(out > 0)

# si on recalcule l'erreur, on arrive à 2/7 : on a bien amélioré le modèle !

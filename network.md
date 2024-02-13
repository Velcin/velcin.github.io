# Analysis of Information Networks

Julien Velcin, Université Lyon 2 - Masters MALIA et MIASHS

Ce cours traite de l'analyse des réseaux d'information, plus spécifiquement lorsque ceux-ci sont modélisés sous la forme de graphes comportant des informations véhiculées en langage naturel.
Il s'agit par exemple des réseaux/médias sociaux ou des bases de données bibliographiques.
Pour ce type de données, il faut réussir à modéliser la partie textuelle (l'information attachée aux noeuds ou aux liens) et la partie structurelle (le réseau).
Cela permet ensuite de résoudre des problèmes de classification (des noeuds, des graphes), de clustering (détection de communauté), de prédiction de liens entre les noeuds, de recherche d'information.

**Plan du cours**

- introduction générale à l'analyse des réseaux d'information
- traitement des données textuelles (prétraitements, représentation vectorielle des documents, modélisation thématique, visualisation, recherche par mots-clefs)
- traitement du réseau (modélisation à l'aide de graphes, visualisation, calcul de scores de centralité, classification et clustering)
- traitement conjoint du texte et de la structure via les GNNs

## Supports de cours

- introduction générale au cours : [slides](https://velcin.github.io/files/NA/part1_introduction.pdf)
- représentation vectorielle des documents : [slides](https://velcin.github.io/files/NA/part2_repr_documents.pdf)
- analyse de graphes : [slides](https://velcin.github.io/files/NA/part3_graphs.pdf)
- apprentissage de thématiques : [slides](https://velcin.github.io/files/NA/part4_topic-learning.pdf)

## Ressources supplémentaires

- Généralités sur les matrices (HEC Montreal) : [extrait](https://velcin.github.io/files/NA/Generalites_sur_matrices.pdf)
- Graph Representation Learning (W.L. Hamilton): [book](https://velcin.github.io/files/NA/GRL_Book.pdf)
- Cours de J. Ah-Pine : [extrait](https://velcin.github.io/files/NA/extrait_CM_AHPINE.pdf)
- Présentation A. Guille à l'atelier TextMine : [slides](https://velcin.github.io/files/NA/GUILLE_textmine2023.pdf)
- Présentation d'A. Gourru de GraphSAGE au groupe de lecture ARIA : [slides](https://velcin.github.io/files/NA/GOURRU_GraphSAGE.pdf)
- Présentation de J. Velcin de GAT au groupe de lecture ARIA : [notes](https://velcin.github.io/files/NA/notes_VELCIN_GAT.pdf)
- Présentation de J. Velcin d'InfoGraph au groupe de lecture ARIA : [notes](https://velcin.github.io/files/NA/notes_VELCIN_InfoGraph.pdf)
- Everything is connected (P. Veličković) : [article](https://velcin.github.io/files/NA/velickovic_2023.pdf)

## Notebooks

- prétraitement du texte 1 : [slides](https://velcin.github.io/files/NA/1.1_text1.html)
- prétraitement du texte 2 : [slides](https://velcin.github.io/files/NA/1.2_text2.html)
- représentation vectoriel du texte 1 : [slides](https://velcin.github.io/files/NA/2.1_vect1.html)
- représentation vectoriel du texte 2 : [slides](https://velcin.github.io/files/NA/2.2_vect2.html)
- représentation vectoriel du texte 3 : [slides](https://velcin.github.io/files/NA/2.3_vect3.html)
- visualisation 1 : [slides](https://velcin.github.io/files/NA/3.1_vis1.html)
- visualisation 2 : [slides](https://velcin.github.io/files/NA/3.2_vis2.html)
- visualisation 3 : [slides](https://velcin.github.io/files/NA/3.3_vis3.html)
- graphes 1 : [slides](https://velcin.github.io/files/NA/4.1_graph1.html)
- graphes 2 : [slides](https://velcin.github.io/files/NA/4.2_graph2.html)
- graphes 3 : [slides](https://velcin.github.io/files/NA/4.3_graph3.html)

## Projet

- [consignes générales](https://velcin.github.io/files/NA/consignes_2023.pdf)
- [cas d'étude MALIA](https://velcin.github.io/files/NA/cas_etude_MALIA.pdf)[données](https://filesender.renater.fr/?s=download&token=9b69c562-d1bd-45a7-961b-717b6b4a6df0)
- [cas d'étude MIASHS](https://velcin.github.io/files/NA/cas_etude_MIASHS.pdf)[données](https://velcin.github.io/files/NA/data_MIASHS.zip)

## Liens

- [Learning on Graphs Conference](https://logconference.org)
- [A Network Map of The Witcher](https://nightingaledvs.com/a-network-map-of-the-witcher/)
- [Understanding Convolutions on Graphs](https://distill.pub/2021/understanding-gnns/)
- [GCN avec code](https://towardsdatascience.com/understanding-graph-convolutional-networks-for-node-classification-a2bfdb7aba7b)
- [Graph Neural Networks: Geometric, Structural and Algorithmic Perspectives, Part 1 (P. Veličković)](https://www.youtube.com/watch?v=pL5Nc8Axv5A)
# Machine Learning pour le traitement des données textuelles

## Travaux Dirigés

Julien Velcin, Université Lyon 2 - Master Humanités Numériques

### Partie 1 : recherche d'information

**Objectif :** prétraitement des données, représentation des documents dans un espace vectoriel, calcul de similarité entre vecteurs/documents

- introduction générale au cours : [slides](https://velcin.github.io/files/HN/introduction.pdf)

- plusieurs présentations autour des humanités numériques et du traitement automatique des textes :  [présentation ARIANE](https://velcin.github.io/files/HN/pres_velcin_ARIANE.pdf), [présentation AFIA](https://velcin.github.io/files/HN/pres_velcin_AFIA.pdf), [présentation LIFRANUM](https://velcin.github.io/files/HN/pres_velcin_LIFRANUM.pdf)

- représentation pour les données textuelles : [slides](https://velcin.github.io/files/HN/representation-textes.pdf)

- introduction à la recherche d'information pour les données textuelles (approches traditionnelles) : [export en html](https://velcin.github.io/files/HN/TD1_M2_HN.html), [notebook](https://velcin.github.io/files/HN/TD1_M2_HN.ipynb)

- rendu n°1 : réalisation d'un moteur de recherche : [consignes rendu 1 (html)](https://velcin.github.io/files/HN/rendu1-squelette.html), [consignes rendu 1 (notebook ipynb)](https://velcin.github.io/files/HN/rendu1-squelette.ipynb)

- corpus possibles : [Alice au pays des merveilles](https://velcin.github.io/files/HN/data/alice.txt), [L'île au trésor](https://velcin.github.io/files/HN/data/treasure.txt)

- liste de mots outils : [mots outils français](https://velcin.github.io/files/HN/stop/Stop-words-french.txt), [mots outils anglais](https://velcin.github.io/files/HN/stop/Stop-words-en.txt)

### Partie 2 : classification supervisée

**Objectif :** utilisation d'algorithmes de classification, mesure des performances (différents types d'erreur)

- Apprentissage automatique (supervisé) : [slides](https://velcin.github.io/files/HN/machine-learning.pdf)

- classification supervisée avec modèles classiques : [export html](https://velcin.github.io/files/HN/TD2_M2_HN.html), [notebook ipynb](https://velcin.github.io/files/HN/TD2_M2_HN.ipynb)

- jeu de données de messages toxiques (extrait): [toxic_10k.csv](https://velcin.github.io/files/HN/data/toxic_10k.csv)

- rendu n°2 : (à venir)

[comment]: classification de critiques de film : [consignes](https://velcin.github.io/files/HN/rendu2-classification.html), [allocine_3k.csv](https://velcin.github.io/files/HN/data/allocine_3k.csv)

### Partie 3 : vers les grands modèles de langue

**Objectif :** architecture du Transformer, connaissance des modèles encodeurs-décodeurs et des modèles génératifs, manipulation de notebook en ligne

- Introduction aux grands modèles de langue : [slides](https://velcin.github.io/files/HN/LLMs.pdf)

- Article de vulgarisation sur ChatGPT : [lien](https://generationia.flint.media/p/secrets-techniques-chatgpt-bard-claude)

- courte démo pour utiliser des plongements (embedding) avec la librairie Spacy : [export html](https://velcin.github.io/files/HN/TD3_M2_HN.html), [notebook ipynb](https://velcin.github.io/files/HN/TD3_M2_HN.ipynb)

- classification de critiques de film à l'aide d'un modèle déjà affiné : [lien google collab](https://colab.research.google.com/drive/17wdal6LOhU47fVQGwqUWQxJMliQK72Nk?usp=sharing)

- prédiction de mots masqués avec CamemBERTa : [lien google collab](https://colab.research.google.com/drive/1Ch9VkYoC73wKqbMj9VBZr-ob9rJ-3Gs3?usp=share_link)

- système de Questions-Réponses : [lien google collab](https://colab.research.google.com/drive/18mogNkH6ou2eAxquN43hJKxgjRx2KbpN?usp=sharing)

- affinage de la famille BERT pour la classification : [lien google collab](https://colab.research.google.com/drive/1p1_Jv-KtyG4tpAyzhGlNYiNCOafakAEA?usp=sharing)

- text classification on GLUE : [lien google collab](https://colab.research.google.com/github/huggingface/notebooks/blob/main/examples/text_classification-tf.ipynb#scrollTo=TlqNaB8jIrJW)

- génération simple de texte avec GPT2 : [lien google collab](https://colab.research.google.com/drive/1YAvRykmuNREzfiHTqc-O9qpEGumpbCUI?usp=sharing)

- utilisation de Mistral pour générer du texte, y compris pour répondre à des questions sur un corpus de son choix (principe RAG) : [export html](https://velcin.github.io/files/HN/Mistral.html), [notebook ipynb](https://velcin.github.io/files/HN/Mistral.ipynb)

- mise au point du solution entièrement locale pour utiliser des LLMs : [export html](https://velcin.github.io/files/HN/Ollama.html), [notebook ipynb](https://velcin.github.io/files/HN/Ollama.ipynb)

[comment]:- modèles génératifs plus avancés basés sur la librairie [OnPrem](https://pypi.org/project/onprem/) : [lien google collab](https://colab.research.google.com/drive/1LVeacsQ9dmE1BVzwR3eTLukpeRIMmUqi?usp=sharing)
### Quelques fonctions maison pour PyTorch
###
### J. VELCIN
### dans le cadre du cours de Deep Learning
### Master MALIA
###

import numpy as np
import torch

from torch.utils.data import Dataset, DataLoader
from torch.nn.functional import one_hot
from torch import LongTensor

# DataSet maison en PyTorch
class CustomDataset(Dataset):
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __len__(self):
        return len(self.x)

    def __getitem__(self, idx):
        return self.x[idx], self.y[idx]

# retourne le dataloader d'un dataset Pytorch
# (fonction finalement peu utile...)
def get_dataloader(dataset, batch_size, shuffle=True):
    return DataLoader(dataset, batch_size=batch_size, shuffle=shuffle)

# joli affichage du modèle *m*
def summary(m):
    total_p = 0
    for i, p in enumerate(m.parameters()):
        num_p = np.prod(p.shape)
        if p.requires_grad:
            trainable = "entrainables"
        else:
            trainable = "figés"
        print(f"Couche {i}: {list(p.shape)} (\x1b[34m{num_p}\x1b[0m paramètres {trainable})")
        total_p += num_p
    print(f"  = \x1b[31m{total_p}\x1b[0m paramètres entrainables")

# fonction tirée de : https://www.kaggle.com/code/mohitchaitanya/simple-iris-dataset-classification-using-pytorch
# calcule l'accuracy en comparant le vecteur one-hot de la vérité au vecteur de prédiction
def get_accuracy_multiclass(pred_arr, original_arr, num_classes=3):
    if len(pred_arr)!=len(original_arr):
        return False
    pred_arr = pred_arr.detach().numpy()
    original_arr = original_arr.detach().numpy()
    final_pred= []
    # we will get something like this in the pred_arr [32.1680,12.9350,-58.4877]
    # so will be taking the index of that argument which has the highest value here 32.1680 which corresponds to 0th index
    for i in range(len(pred_arr)):
        final_pred.append(one_hot(LongTensor([np.argmax(pred_arr[i])]), num_classes=num_classes).squeeze().numpy())
    #final_pred = np.array(final_pred)
    count = 0
    #here we are doing a simple comparison between the predicted_arr and the original_arr to get the final accuracy
    for i in range(len(original_arr)):    
        #print(final_pred[i] == original_arr[i])
        if all(v for v in (final_pred[i] == original_arr[i])):
            count+=1
    return count/len(final_pred)

# fonction maison pour évaluer le *model* sur le sous-ensemble *subset* (dataloader)
# (calcul d'une accuracy pour la classification)
def evaluate_model(model, subset):
    model.eval()
    with torch.no_grad():
        total_len = 0.0
        total_acc = 0.0
        for images, labels in subset:
            test_output, _ = model(images)
            pred_y = torch.max(test_output, 1)[1] 
            total_acc += float((pred_y == labels).sum().item())
            total_len += float(labels.size(0))
    return total_acc / total_len


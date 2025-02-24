import torch
import torchvision.models as models

DEVICE = torch.device("cuda" if torch.cuda.is_available() else "cpu")

if __name__ == "__main__":
    print("Device:", DEVICE)
    model_ft = models.vgg16(pretrained=True).features.to(DEVICE)
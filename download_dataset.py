# import gdown
import os

URL = "https://drive.google.com/uc?id=1rbq6oryvBuTZxp_JicOtlneOsgfU13W_"
OUTPUT = "./datasets/edge_mixed.tar"

path = "./datasets/edge_mixed"
def delete_dot_files(path):
    for root, dirs, files in os.walk(path):
        for file in files:
            if file.startswith('.'):
                os.remove(os.path.join(root, file))
                print(os.path.join(root, file))
    
    
if __name__ == "__main__":
    # gdown.download(URL, OUTPUT, quiet=False)
    
    delete_dot_files(path)
    
    # https://drive.google.com/file/d/1l5g1Qgfvj0gFWBqLQm9V9VWQv6jN0pid/view?usp=sharing
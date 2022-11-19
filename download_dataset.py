import gdown

URL = "https://drive.google.com/uc?id=1aRhU_CuytR21sUgAS8yVk3XPhLGBXnEk"
OUTPUT = "./dataset/shoe_edges.tgz"

if __name__ == "__main__":
    gdown.download(URL, OUTPUT, quiet=False)
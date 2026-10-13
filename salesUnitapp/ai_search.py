
import torch
import numpy as np
from transformers import CLIPModel, CLIPProcessor


MODEL_NAME = "openai/clip-vit-base-patch32"

# Load the model once when the module is imported
processor = CLIPProcessor.from_pretrained(MODEL_NAME)
model = CLIPModel.from_pretrained(MODEL_NAME)
model.eval()


def get_image_embedding(image):
    """
    Convert a PIL image into a normalized CLIP embedding.
    """
    image = image.convert("RGB")

    inputs = processor(
        images=image,
        return_tensors="pt"
    )

    with torch.no_grad():
        features = model.get_image_features(**inputs)

    # Handle different Transformers output formats
    if hasattr(features, "pooler_output"):
        features = features.pooler_output

    if hasattr(features, "image_embeds"):
        features = features.image_embeds

    features = features / features.norm(
        p=2,
        dim=-1,
        keepdim=True
    )

    return features[0].cpu().numpy().tolist()


def similarity(embedding1, embedding2):
    """
    Calculate cosine similarity between two normalized embeddings.
    """
    a = np.asarray(embedding1, dtype=np.float32)
    b = np.asarray(embedding2, dtype=np.float32)

    if a.shape != b.shape or a.size == 0:
        return 0.0

    return float(np.dot(a, b))

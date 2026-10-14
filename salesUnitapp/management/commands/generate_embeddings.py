"""
Backfill CLIP embeddings for products that don't have one yet.

Place at:  <yourapp>/management/commands/generate_embeddings.py
(both `management/` and `commands/` need an empty __init__.py)

Run:       python manage.py generate_embeddings
Re-do all: python manage.py generate_embeddings --all
"""
from django.core.management.base import BaseCommand
from PIL import Image

from salesUnitapp.ai_search import get_image_embedding # keep in sync with your module name
from salesUnitapp.models import tb_product


class Command(BaseCommand):
    help = "Generate image embeddings for products (used by image search)."

    def add_arguments(self, parser):
        parser.add_argument(
            "--all",
            action="store_true",
            help="Regenerate embeddings for every product, not just missing ones.",
        )

    def handle(self, *args, **options):
        products = tb_product.objects.exclude(img="")

        if not options["all"]:
            products = products.filter(image_embedding__isnull=True)

        done, failed = 0, 0

        for product in products:
            try:
                with Image.open(product.img.path) as image:
                    product.image_embedding = get_image_embedding(image.convert("RGB"))
                product.save(update_fields=["image_embedding"])
                done += 1
            except Exception as exc:
                failed += 1
                self.stderr.write(f"Skipped product {product.id} ({product.name}): {exc}")

        self.stdout.write(self.style.SUCCESS(f"Embeddings created: {done}, failed: {failed}"))
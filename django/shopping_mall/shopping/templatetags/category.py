from shopping.models import Goods_type
from django import template


register = template.Library()

@register.simple_tag
def get_categories():
    return Goods_type.objects.all()
# Generated by Django 2.1.5 on 2019-02-28 10:57

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('shopping', '0008_auto_20190228_1051'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order_goods',
            name='goods',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='shopping.Goods', verbose_name='商品编号'),
        ),
        migrations.AlterField(
            model_name='order_goods',
            name='itme_id',
            field=models.IntegerField(null=True, verbose_name='hehe'),
        ),
    ]

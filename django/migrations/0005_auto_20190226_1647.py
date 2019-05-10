# Generated by Django 2.1.5 on 2019-02-26 16:47

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('shopping', '0004_order_itme'),
    ]

    operations = [
        migrations.CreateModel(
            name='Order_goods',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('total1', models.FloatField(null=True, verbose_name='商品小计')),
                ('num1', models.IntegerField(null=True, verbose_name='商品数量')),
                ('goods', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='shopping.Goods', verbose_name='商品编号')),
            ],
            options={
                'verbose_name': '订单详情',
                'verbose_name_plural': '订单详情',
            },
        ),
        migrations.RenameField(
            model_name='order',
            old_name='itme',
            new_name='itmes',
        ),
        migrations.RemoveField(
            model_name='order',
            name='name',
        ),
        migrations.RemoveField(
            model_name='order',
            name='num1',
        ),
        migrations.RemoveField(
            model_name='order',
            name='total1',
        ),
        migrations.AlterField(
            model_name='order',
            name='status',
            field=models.IntegerField(choices=[(0, '去付款'), (1, '查看物流')], default=1, verbose_name='付款/查看'),
        ),
        migrations.AddField(
            model_name='order_goods',
            name='itme_id',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='shopping.Order', verbose_name='订单编号'),
        ),
    ]
## one-to many-case
An example of importing data into IRIS from 3 csv files that are connected to each other: it's a story of a sales system with name "SuperSystems" which is a software enterprise that produces products (listed in /data/products.csv), which companies (listed in companiles.csv) tend to buy license/purchase a subscription through years - these facts are depicted in sales.csv.

The setup of the example loads the data into /src/dc/onetomany/companies.cls,products.cls and sales.cls respectively via csvgenpy module and this all is going on in /src/dc/onetomany/setup.cls:Init() class method.

Notice that facts of companies purchasing products are depicted in sales.csv where you can see id's of companies and products, so they should be preserved.

And the example shows that the way the data, containing ids (which are IDkeys and PrimaryKeys both) can be imported to IRIS classes/tables - notice e.g. the INDEX element in products.cls:

```ObjectScript
Index PRODUCTSPKEY1 On id [ IdKey, PrimaryKey, SqlName = PRODUCTS_PKEY1, Unique ];
```



So, feel free to use the example and to fork/PR of sharing any other possible ways how the data that needs to be travelled e.g. in csvs that contains entities linkage (e.g. via IDs) and so that first:
can be imported to IRIS
should be maintained "on your own" - like here, as IDs in companies.cls and products.cls are not maintained by IRIS.

Make the changes please and make sure that after changes the data imported is accurate - there is a unittest that checks sum of sales for companies 103 and 104, equal 17000 and 7000 respectively so after importing the data test should still work:

```
zpm:USER>test dc-onetomany-case
```

Enjoy!





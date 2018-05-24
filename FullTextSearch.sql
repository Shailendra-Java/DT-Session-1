/* CLUSTERED Index */
CREATE UNIQUE CLUSTERED INDEX Idx_Employeeid
ON Employee(Employee_Id)
WITH FILLFACTOR 10

/* NONCLUSTERED Index */
CREATE UNIQUE NONCLUSTERED INDEX Idx_Employeeid
ON Employee(Employee_Id)
WITH FILLFACTOR 10

/* Filter Index */ 
CREATE UNIQUE CLUSTERED INDEX Idx_Employeeid
ON Employee(Employee_Id)
WHERE Title = 'Tool Manager'

/* XML Index for primary */
CREATE PRIMARY XML INDEX Prm_xml_idx 
ON ProductModel(ProductDescription)

/* XML Index for secondry */
CREATE XML INDEX Pidx_xml
ON ProductModel(ProductDescription)
USING XML INDEX Prm_xml_idx
FOR VALUE

/* Partition on index */
/* Step -1 Partition function*/
CREATE PARTITION FUNCTION POrderDate (datetime)
AS RANGE RIGHT FOR VALUES ('2002-01-01','2005-01-01')

/* Step -2 Partition schema*/
CREATE PARTITION SCHEMA PSOrderDate
AS PARTITION POrderDate
TO (fg1,fg2,fg3)

/* Step -3 Partition index*/
CREATE UNIQUE CLUSTERED INDEX Idx_SalesOrder
ON SalesOrder(OrderId)
ON PSOrderDate(OrderDate)


/* FULLTEXT SEARCH */
1. Create fulltext catalog
2. Create a unique index
3. Create a fulltext index
4. Populate the fulltext index

1. CREATE FULLTEXT CATALOG Cat1 AS DEFAULT
2. CREATE UNIQUE INDEX Ix_Desc ON Product(ProductDescription)
3. CREATE FULLTEXT INDEX ON Product(ProductDescription) KEY INDEX Ix_Desc
4. 
CREATE TABLE CustomerDim (
    CustomerID INTEGER PRIMARY KEY,
    Name TEXT,
    Location TEXT,
    Gender TEXT,
    Age INTEGER
);

CREATE TABLE ProductDim (
    ProductID INTEGER PRIMARY KEY,
    ProductName TEXT,
    Category TEXT,
    Price REAL
);

CREATE TABLE TimeDim (
    TimeID INTEGER PRIMARY KEY,
    Date TEXT,
    Quarter TEXT,
    Year INTEGER
);

CREATE TABLE SalesFact (
    SalesID INTEGER PRIMARY KEY AUTOINCREMENT,
    CustomerID INTEGER,
    ProductID INTEGER,
    TimeID INTEGER,
    Quantity INTEGER,
    SalesAmount REAL,
    FOREIGN KEY (CustomerID) REFERENCES CustomerDim(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES ProductDim(ProductID),
    FOREIGN KEY (TimeID) REFERENCES TimeDim(TimeID)
);

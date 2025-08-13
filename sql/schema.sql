-- Star schema for Retail DW (SQLite)

-- Dimension tables
CREATE TABLE IF NOT EXISTS CustomerDim (
  CustomerKey INTEGER PRIMARY KEY,
  CustomerID INTEGER,
  Country TEXT,
  total_purchases REAL,
  total_transactions INTEGER
);

CREATE TABLE IF NOT EXISTS ProductDim (
  ProductKey INTEGER PRIMARY KEY,
  StockCode TEXT,
  Description TEXT,
  Category TEXT,
  UnitPrice REAL
);

CREATE TABLE IF NOT EXISTS TimeDim (
  TimeKey INTEGER PRIMARY KEY,
  Date TEXT,        -- ISO 'YYYY-MM-DD'
  Day INTEGER,
  Month INTEGER,
  MonthName TEXT,
  Quarter INTEGER,
  Year INTEGER
);

-- Fact table
CREATE TABLE IF NOT EXISTS SalesFact (
  SalesFactID INTEGER PRIMARY KEY,
  InvoiceNo TEXT,
  CustomerKey INTEGER,
  ProductKey INTEGER,
  TimeKey INTEGER,
  Quantity INTEGER,
  UnitPrice REAL,
  TotalSales REAL,
  FOREIGN KEY (CustomerKey) REFERENCES CustomerDim(CustomerKey),
  FOREIGN KEY (ProductKey) REFERENCES ProductDim(ProductKey),
  FOREIGN KEY (TimeKey) REFERENCES TimeDim(TimeKey)
);

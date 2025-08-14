```mermaid
erDiagram
  CustomerDim ||--o{ SalesFact : has
  ProductDim  ||--o{ SalesFact : has
  TimeDim     ||--o{ SalesFact : has

  CustomerDim { int CustomerKey PK
                int CustomerID
                string Country
                float total_purchases
                int total_transactions }
  ProductDim  { int ProductKey PK
                string StockCode
                string Description
                string Category
                float UnitPrice }
  TimeDim     { int TimeKey PK
                date Date
                int Day
                int Month
                string MonthName
                int Quarter
                int Year }
  SalesFact   { int SalesFactID PK
                string InvoiceNo
                int CustomerKey FK
                int ProductKey FK
                int TimeKey FK
                int Quantity
                float UnitPrice
                float TotalSales }

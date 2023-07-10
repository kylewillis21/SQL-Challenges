-- Challenge found at https://steeldata.org.uk/sql4.html
-- # 1 What are the names of all the customers who live in New York?
SELECT FirstName, LastName, City FROM Customers
WHERE City = 'New York';

-- # 2 What is the total number of accounts in the Accounts table?
SELECT COUNT(AccountID) as NumAccounts FROM Accounts;

-- # 3 What is the total balance of all checking accounts?
SELECT SUM(Balance) as TotalCheck FROM Accounts
WHERE AccountType = 'Checking';

-- # 4 What is the total balance of all accounts associated with customers who live in Los Angeles?
SELECT SUM(Balance) as TotalBalanceLA FROM Accounts
JOIN Customers
ON Accounts.CustomerID = Customers.CustomerID
WHERE City = 'Los Angeles';

-- # 5 Which branch has the highest average account balance?
SELECT BranchName, AVG(Balance) as AverageBalance FROM Accounts
JOIN Branches
ON Branches.BranchID = Accounts.BranchID
GROUP BY BranchName
ORDER BY AverageBalance DESC;

-- # 6 Which customer has the highest current balance in their accounts?
SELECT FirstName, LastName, AccountType, SUM(Balance) as TotalBalance FROM Customers
JOIN Accounts
ON Accounts.CustomerID = Customers.CustomerID
GROUP BY FirstName, LastName, AccountType
ORDER BY TotalBalance DESC;

-- # 7 Which customer has made the most transactions in the Transactions table?
SELECT FirstName, LastName, COUNT(TransactionID) as NumTransactions FROM Customers
JOIN Accounts
ON Customers.CustomerID = Accounts.CustomerID
JOIN Transactions
ON Transactions.AccountID = Accounts.AccountID
GROUP BY Customers.CustomerID
ORDER BY NumTransactions DESC;

-- # 8 Which branch has the highest total balance across all of its accounts?
SELECT BranchName, SUM(Balance) as BranchBalance FROM Branches
JOIN Accounts
ON Accounts.BranchID = Branches.BranchID
GROUP BY BranchName
ORDER BY BranchBalance DESC;

-- # 9 Which customer has the highest total balance across all of their accounts, including savings and checking accounts?
SELECT FirstName, LastName, SUM(Balance) as TotalBalance FROM Customers
JOIN Accounts
ON Accounts.CustomerID = Customers.CustomerID
GROUP BY Accounts.CustomerID
ORDER BY TotalBalance DESC; 

-- # 10 Which branch has the highest number of transactions in the Transactions table?
SELECT BranchName, COUNT(TransactionID) as NumTrans FROM Accounts
JOIN Transactions
ON Transactions.AccountID = Accounts.AccountID
JOIN Branches
ON Accounts.BranchID = Branches.BranchID
GROUP BY BranchName
ORDER BY NumTrans DESC
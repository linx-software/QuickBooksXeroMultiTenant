CREATE TABLE Clients (
    ClientId INT PRIMARY KEY IDENTITY(1,1),
    ClientName NVARCHAR(100) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE QuickBooksTokens (
    TokenId INT PRIMARY KEY IDENTITY(1,1),
    ClientId INT FOREIGN KEY REFERENCES Clients(ClientId),
	QB_Client_ID NVARCHAR(MAX),
    QB_ClientSecret NVARCHAR(MAX),
    RealmId NVARCHAR(50) NOT NULL UNIQUE,
    AccessToken NVARCHAR(MAX),
    RefreshToken NVARCHAR(MAX),
    AccessTokenRetrievedAt DATETIME,
    AccessTokenExpiresInSeconds INT,
    RefreshTokenExpiresInSeconds INT,
    CreatedAt DATETIME DEFAULT GETDATE(),
    LastUpdatedAt DATETIME DEFAULT GETDATE()
);


CREATE TABLE XeroTokens (
    TokenId INT PRIMARY KEY IDENTITY(1,1),
    ClientId INT FOREIGN KEY REFERENCES Clients(ClientId),
    TenantId NVARCHAR(100) NOT NULL,  -- This is Xero's equivalent of RealmId
    Xero_Client_ID NVARCHAR(MAX),
    Xero_ClientSecret NVARCHAR(MAX),
    AccessToken NVARCHAR(MAX),
    RefreshToken NVARCHAR(MAX),
    AccessTokenRetrievedAt DATETIME,
    AccessTokenExpiresInSeconds INT,
    RefreshTokenExpiresInSeconds INT,
    CreatedAt DATETIME DEFAULT GETDATE(),
    LastUpdatedAt DATETIME DEFAULT GETDATE()
);
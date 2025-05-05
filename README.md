# 💼 Accounting Integration App (Xero + QuickBooks)

This solution integrates **QuickBooks** and **Xero** APIs for multi-client accounting data access. Built using **Linx**, it supports token management, client-specific configuration, and data retrieval (e.g., Balance Sheets). Data is stored in **SQL Server**.

---

## 📦 Components

### 🔧 **Database**
- SQL Server DB with the following objects:
  - `Clients` table
  - `QuickBooksTokens`
  - `XeroTokens`
- Includes scripts for database creation and population.

---

### ⚙️ **Linx Solution**
This Linx solution handles REST calls to both QuickBooks and Xero.

#### 📘 QuickBooks Functions
| Function | Description |
|----------|-------------|
| `QBRefreshAccessToken` | Refreshes QuickBooks access token |
| `GetBalanceSheet` | Retrieves a Balance Sheet report |
| `GetQuickBooksAccessToken` | Gets access token (refreshes only if needed) |
| `QBTestMyCalls` | Test/Example function for QB (uses `GetClientID`) |

#### 📗 Xero Functions
| Function | Description |
|----------|-------------|
| `XeroRefreshAccessToken` | Refreshes Xero access token |
| `GetBalanceSheet` | Retrieves a Balance Sheet report |
| `GetXeroAccessToken` | Gets access token (refreshes only if needed) |
| `XeroTestMyCalls` | Test/Example function for Xero (uses `GetClientID`) |

#### 📁 Generic Functions
| Function | Description |
|----------|-------------|
| `CreateClient` | Creates a client in the database (Xero or QB) |
| `GetClientID` | Retrieves client ID by name |
| `CreateClientRecord` | Adds a client record |
| `CreateQuickBooksRecord` | Adds QuickBooks token record |
| `CreateXeroRecord` | Adds Xero token record |
| `UpdateQuickBooksRecord` | Updates QuickBooks token info |
| `UpdateXeroRecord` | Updates Xero token info |

---

## 🔧 Linx Settings

| Setting | Description |
|---------|-------------|
| `DatabaseConnection` | SQL Server connection string |
| `QuickBooksBaseURI` | Base URI for QuickBooks API (sandbox or prod) |
| `XeroBaseURI` | Base URI for Xero API |

---

## 🚀 Usage Instructions

1. **Create a Client**
   - Call `CreateClient` with the necessary metadata and type (`Xero` or `QuickBooks`).
   - Also populate relevant token tables using `CreateQuickBooksRecord` or `CreateXeroRecord`.

2. **Token Handling**
   - Use `GetClientID` to get the client identifier.
   - Then use either:
     - `GetQuickBooksAccessToken` or
     - `GetXeroAccessToken`  
     These functions will check token validity and refresh if required.

3. **Call an Endpoint**
   - Use the relevant `GetBalanceSheet` function for either platform.
   - These are examples — you can add more endpoints following the same structure.

---

## ➕ Adding New Endpoints

1. Copy and adapt an existing function like `GetBalanceSheet`.
2. Modify:
   - The **URL**
   - **HTTP Method**
   - Optional **Body** parameters
3. Create a new **Type** under the `Types` folder (preferably in a subfolder).
4. Set the response body to this Type.

---

## ⚠️ Notes

- **OAuth Authorization** (consent flow) for both Xero and QuickBooks must be handled externally.
- This solution assumes valid tokens are obtained and stored before calling these functions.
- Always update and store the **latest refresh tokens** after each token refresh (especially important for Xero and QuickBooks).

---

_Last updated: 2025-05-05 10:34 UTC_

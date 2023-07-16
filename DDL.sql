CREATE SCHEMA fetch_rewards;

CREATE TABLE fetch_rewards."Users" (
    ID VARCHAR(24) PRIMARY KEY,
    Active BOOLEAN,
    CreatedDate TIMESTAMP,
    LastLogin TIMESTAMP,
    Role VARCHAR(20),
    SignUpSource VARCHAR(20),
    State VARCHAR(2)
);

CREATE TABLE fetch_rewards."Receipts" (
    ID VARCHAR(24) PRIMARY KEY,
    BonusPointsEarned INTEGER,
    BonusPointsEarnedReason VARCHAR(255),
    CreateDate TIMESTAMP,
    DateScanned TIMESTAMP,
    FinishedDate TIMESTAMP,
    ModifyDate TIMESTAMP,
    PointsAwardedDate TIMESTAMP,
    PointsEarned FLOAT,
    PurchaseDate TIMESTAMP,
    PurchasedItemCount INTEGER,
    RewardsReceiptStatus VARCHAR(20),
    TotalSpent FLOAT,
    UserID VARCHAR(24),
    FOREIGN KEY(UserID) REFERENCES fetch_rewards."Users"(ID)
);

CREATE TABLE fetch_rewards."Brands" (
    ID VARCHAR(24) PRIMARY KEY,
    Barcode VARCHAR(20),
    Category VARCHAR(255),
    CategoryCode VARCHAR(20),
    CPG_ID VARCHAR(24),
    CPG_Ref VARCHAR(255),
    Name VARCHAR(255),
    TopBrand BOOLEAN
);



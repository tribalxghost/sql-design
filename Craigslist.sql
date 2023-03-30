-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Region" (
    "RegionID" int   NOT NULL,
    CONSTRAINT "pk_Region" PRIMARY KEY (
        "RegionID"
     )
);

CREATE TABLE "Users" (
    "UserID" int   NOT NULL,
    "RegionID" int   NOT NULL,
    "PostID" int   NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "UserID"
     )
);

-- Table documentation comment 1 (try the PDF/RTF export)
-- Table documentation comment 2
CREATE TABLE "Post" (
    "PostID" int   NOT NULL,
    -- Field documentation comment 1
    -- Field documentation comment 2
    -- Field documentation comment 3
    "Name" varchar(200)   NOT NULL,
    "Title" varchar()   NOT NULL,
    "Text" varchar()   NOT NULL,
    "RegionID" int   NOT NULL,
    "UserID" int   NOT NULL,
    "CategoryID" int   NOT NULL,
    CONSTRAINT "pk_Post" PRIMARY KEY (
        "PostID"
     ),
    CONSTRAINT "uc_Post_Name" UNIQUE (
        "Name"
    )
);

CREATE TABLE "Category" (
    "CategoryID" int   NOT NULL,
    "PostID" int   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "CategoryID"
     )
);

ALTER TABLE "Users" ADD CONSTRAINT "fk_Users_RegionID" FOREIGN KEY("RegionID")
REFERENCES "Region" ("RegionID");

ALTER TABLE "Users" ADD CONSTRAINT "fk_Users_PostID" FOREIGN KEY("PostID")
REFERENCES "Post" ("PostID");

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_RegionID" FOREIGN KEY("RegionID")
REFERENCES "Region" ("RegionID");

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_UserID" FOREIGN KEY("UserID")
REFERENCES "Users" ("UserID");

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_CategoryID" FOREIGN KEY("CategoryID")
REFERENCES "Category" ("CategoryID");

ALTER TABLE "Category" ADD CONSTRAINT "fk_Category_PostID" FOREIGN KEY("PostID")
REFERENCES "Post" ("PostID");


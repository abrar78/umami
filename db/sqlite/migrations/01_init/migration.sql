-- CreateTable
CREATE TABLE IF NOT EXISTS "user" (
    "user_id" TEXT PRIMARY KEY NOT NULL,
    "username" TEXT UNIQUE NOT NULL,
    "password" TEXT NOT NULL,
    "role" TEXT NOT NULL,
    "created_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME,
    "deleted_at" DATETIME
);

-- CreateTable
CREATE TABLE IF NOT EXISTS "session" (
    "session_id" TEXT PRIMARY KEY NOT NULL,
    "website_id" TEXT NOT NULL,
    "hostname" TEXT,
    "browser" TEXT,
    "os" TEXT,
    "device" TEXT,
    "screen" TEXT,
    "language" TEXT,
    "country" TEXT,
    "subdivision1" TEXT,
    "subdivision2" TEXT,
    "city" TEXT,
    "created_at" DATETIME DEFAULT CURRENT_TIMESTAMP

);

-- CreateTable
CREATE TABLE IF NOT EXISTS "website" (
    "website_id" TEXT PRIMARY KEY NOT NULL,
    "name" TEXT NOT NULL,
    "domain" TEXT,
    "share_id" TEXT,
    "reset_at" DATETIME,
    "user_id" TEXT,
    "created_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME,
    "deleted_at" DATETIME
);

-- CreateTable
CREATE TABLE IF NOT EXISTS "website_event" (
    "event_id" TEXT PRIMARY KEY NOT NULL,
    "website_id" TEXT NOT NULL,
    "session_id" TEXT NOT NULL,
    "created_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "url_path" TEXT NOT NULL,
    "url_query" TEXT,
    "referrer_path" TEXT,
    "referrer_query" TEXT,
    "referrer_domain" TEXT,
    "page_title" TEXT,
    "event_type" INTEGER NOT NULL DEFAULT 1,
    "event_name" TEXT
);

-- CreateTable
CREATE TABLE IF NOT EXISTS "event_data" (
    "event_id" TEXT PRIMARY KEY NOT NULL,
    "website_event_id" TEXT NOT NULL,
    "website_id" TEXT NOT NULL,
    "event_key" TEXT NOT NULL,
    "event_string_value" TEXT,
    "event_numeric_value" NUMERIC,
    "event_date_value" DATETIME,
    "event_data_type" INTEGER NOT NULL,
    "created_at" DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE IF NOT EXISTS "team" (
    "team_id" TEXT PRIMARY KEY NOT NULL,
    "name" TEXT NOT NULL,
    "access_code" TEXT,
    "created_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME

);

-- CreateTable
CREATE TABLE IF NOT EXISTS "team_user" (
    "team_user_id" TEXT PRIMARY KEY NOT NULL,
    "team_id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "role" TEXT NOT NULL,
    "created_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME

);

-- CreateTable
CREATE TABLE IF NOT EXISTS "team_website" (
    "team_website_id" TEXT PRIMARY KEY NOT NULL,
    "team_id" TEXT NOT NULL,
    "website_id" TEXT NOT NULL,
    "created_at" DATETIME DEFAULT CURRENT_TIMESTAMP

);

-- CreateIndex
CREATE UNIQUE INDEX "user_user_id_key" ON user(user_id);

-- CreateIndex
CREATE UNIQUE INDEX "user_username_key" ON "user"("username");

-- CreateIndex
CREATE UNIQUE INDEX "session_session_id_key" ON "session"("session_id");

-- CreateIndex
CREATE INDEX "session_created_at_idx" ON "session"("created_at");

-- CreateIndex
CREATE INDEX "session_website_id_idx" ON "session"("website_id");

-- CreateIndex
CREATE UNIQUE INDEX "website_website_id_key" ON "website"("website_id");

-- CreateIndex
CREATE UNIQUE INDEX "website_share_id_key" ON "website"("share_id");

-- CreateIndex
CREATE INDEX "website_user_id_idx" ON "website"("user_id");

-- CreateIndex
CREATE INDEX "website_created_at_idx" ON "website"("created_at");

-- CreateIndex
CREATE INDEX "website_share_id_idx" ON "website"("share_id");

-- CreateIndex
CREATE INDEX "website_event_created_at_idx" ON "website_event"("created_at");

-- CreateIndex
CREATE INDEX "website_event_session_id_idx" ON "website_event"("session_id");

-- CreateIndex
CREATE INDEX "website_event_website_id_idx" ON "website_event"("website_id");

-- CreateIndex
CREATE INDEX "website_event_website_id_created_at_idx" ON "website_event"("website_id", "created_at");

-- CreateIndex
CREATE INDEX "website_event_website_id_session_id_created_at_idx" ON "website_event"("website_id", "session_id", "created_at");

-- CreateIndex
CREATE INDEX "event_data_created_at_idx" ON "event_data"("created_at");

-- CreateIndex
CREATE INDEX "event_data_website_id_idx" ON "event_data"("website_id");

-- CreateIndex
CREATE INDEX "event_data_website_event_id_idx" ON "event_data"("website_event_id");

-- CreateIndex
CREATE UNIQUE INDEX "team_team_id_key" ON "team"("team_id");

-- CreateIndex
CREATE UNIQUE INDEX "team_access_code_key" ON "team"("access_code");

-- CreateIndex
CREATE INDEX "team_access_code_idx" ON "team"("access_code");

-- CreateIndex
CREATE UNIQUE INDEX "team_user_team_user_id_key" ON "team_user"("team_user_id");

-- CreateIndex
CREATE INDEX "team_user_team_id_idx" ON "team_user"("team_id");

-- CreateIndex
CREATE INDEX "team_user_user_id_idx" ON "team_user"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "team_website_team_website_id_key" ON "team_website"("team_website_id");

-- CreateIndex
CREATE INDEX "team_website_team_id_idx" ON "team_website"("team_id");

-- CreateIndex
CREATE INDEX "team_website_website_id_idx" ON "team_website"("website_id");

-- AddSystemUser
INSERT INTO "user" ("user_id", "username", "role", "password") VALUES ('41e2b680-648e-4b09-bcd7-3e2b10c06264', 'admin', 'admin', '$2b$10$BUli0c.muyCW1ErNJc3jL.vFRFtFJWrT8/GcR4A.sUdCznaXiqFXa');

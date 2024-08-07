CREATE DATABASE capybara_dating_app;

\c capybara_dating_app

CREATE TABLE personality_summaries (
    id SERIAL PRIMARY KEY,
    telegram_user_id TEXT REFERENCES users(telegram_user_id) UNIQUE,
    username TEXT,
    personality_type TEXT,
    explanation TEXT,
    compatible_types TEXT[],
    dating_advice TEXT,
    questions TEXT[],
    answers TEXT[],
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_telegram_user_id ON personality_summaries(telegram_user_id);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    telegram_user_id TEXT NOT NULL UNIQUE,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    photo_url TEXT,
    auth_date TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE onboarding (
    id SERIAL PRIMARY KEY,
    telegram_user_id TEXT REFERENCES users(telegram_user_id) UNIQUE,
    gender VARCHAR(100),
    sexuality VARCHAR(100),
    family_plans VARCHAR(100),
    personal_values JSONB,
    interests JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


CREATE INDEX idx_onboarding_telegram_user_id ON onboarding(telegram_user_id);

CREATE INDEX idx_users_telegram_user_id ON users(telegram_user_id);

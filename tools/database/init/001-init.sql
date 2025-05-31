-- Create extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Create schemas
CREATE SCHEMA IF NOT EXISTS catalyze;

-- Set default schema
SET search_path TO catalyze, public;

-- Create initial tables for catalyze
-- Note: These will be properly defined when we set up the backend with Drizzle migrations

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL DEFAULT 'investor',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Assets table (crypto, stocks, bonds, etc.)
CREATE TABLE IF NOT EXISTS assets (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    symbol VARCHAR(10) NOT NULL UNIQUE,
    description TEXT,
    type VARCHAR(50) NOT NULL,
    current_price DECIMAL(20,8) NOT NULL DEFAULT 0,
    price_change_24h DECIMAL(10,4) DEFAULT 0,
    market_cap DECIMAL(20,2) DEFAULT 0,
    volume_24h DECIMAL(20,2) DEFAULT 0,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Portfolios table
CREATE TABLE IF NOT EXISTS portfolios (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    total_value DECIMAL(20,2) DEFAULT 0,
    total_invested DECIMAL(20,2) DEFAULT 0,
    total_return DECIMAL(20,2) DEFAULT 0,
    return_percentage DECIMAL(10,4) DEFAULT 0,
    risk_level VARCHAR(20) DEFAULT 'moderate',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Investments table  
CREATE TABLE IF NOT EXISTS investments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    portfolio_id UUID REFERENCES portfolios(id) ON DELETE CASCADE,
    asset_id UUID REFERENCES assets(id),
    user_id UUID REFERENCES users(id),
    amount DECIMAL(20,2) NOT NULL,
    quantity DECIMAL(20,8) NOT NULL,
    entry_price DECIMAL(20,8) NOT NULL,
    current_price DECIMAL(20,8) DEFAULT 0,
    current_value DECIMAL(20,2) DEFAULT 0,
    unrealized_gain DECIMAL(20,2) DEFAULT 0,
    unrealized_gain_percent DECIMAL(10,4) DEFAULT 0,
    status VARCHAR(50) NOT NULL DEFAULT 'pending',
    transaction_hash VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Transactions table
CREATE TABLE IF NOT EXISTS transactions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id),
    portfolio_id UUID REFERENCES portfolios(id),
    asset_id UUID REFERENCES assets(id),
    type VARCHAR(50) NOT NULL,
    amount DECIMAL(20,2) NOT NULL,
    quantity DECIMAL(20,8),
    price DECIMAL(20,8),
    fee DECIMAL(20,2) DEFAULT 0,
    status VARCHAR(50) NOT NULL DEFAULT 'pending',
    hash VARCHAR(255),
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Staking pools table
CREATE TABLE IF NOT EXISTS staking_pools (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    asset_id UUID REFERENCES assets(id),
    apy DECIMAL(5,2) NOT NULL,
    minimum_stake DECIMAL(20,2) NOT NULL,
    lockup_period INTEGER NOT NULL,
    total_staked DECIMAL(20,2) DEFAULT 0,
    max_capacity DECIMAL(20,2),
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Stakes table
CREATE TABLE IF NOT EXISTS stakes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id),
    pool_id UUID REFERENCES staking_pools(id),
    amount DECIMAL(20,2) NOT NULL,
    start_date TIMESTAMP WITH TIME ZONE NOT NULL,
    end_date TIMESTAMP WITH TIME ZONE NOT NULL,
    current_reward DECIMAL(20,2) DEFAULT 0,
    status VARCHAR(50) NOT NULL DEFAULT 'active',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_assets_symbol ON assets(symbol);
CREATE INDEX IF NOT EXISTS idx_assets_type ON assets(type);
CREATE INDEX IF NOT EXISTS idx_portfolios_user_id ON portfolios(user_id);
CREATE INDEX IF NOT EXISTS idx_investments_portfolio_id ON investments(portfolio_id);
CREATE INDEX IF NOT EXISTS idx_investments_user_id ON investments(user_id);
CREATE INDEX IF NOT EXISTS idx_investments_asset_id ON investments(asset_id);
CREATE INDEX IF NOT EXISTS idx_transactions_user_id ON transactions(user_id);
CREATE INDEX IF NOT EXISTS idx_transactions_type ON transactions(type);
CREATE INDEX IF NOT EXISTS idx_stakes_user_id ON stakes(user_id);
CREATE INDEX IF NOT EXISTS idx_stakes_pool_id ON stakes(pool_id);

-- Insert some sample data for development
INSERT INTO users (email, name, role) VALUES 
    ('admin@catalyze.com', 'Admin User', 'admin'),
    ('investor1@example.com', 'Jane Investor', 'investor'),
    ('investor2@example.com', 'John Trader', 'investor')
ON CONFLICT (email) DO NOTHING;

-- Insert sample assets
INSERT INTO assets (name, symbol, type, current_price) VALUES 
    ('Bitcoin', 'BTC', 'crypto', 50000.00),
    ('Ethereum', 'ETH', 'crypto', 3000.00),
    ('Apple Inc.', 'AAPL', 'stock', 150.00),
    ('S&P 500 Index', 'SPY', 'index', 400.00)
ON CONFLICT (symbol) DO NOTHING; 
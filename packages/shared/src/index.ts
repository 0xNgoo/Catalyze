// Core types
export interface User {
  id: string;
  email: string;
  name: string;
  role: 'investor' | 'admin';
  createdAt: Date;
  updatedAt: Date;
}

export interface Asset {
  id: string;
  name: string;
  symbol: string;
  description: string;
  type: 'crypto' | 'stock' | 'bond' | 'commodity' | 'index';
  currentPrice: number;
  priceChange24h: number;
  marketCap: number;
  volume24h: number;
  isActive: boolean;
  createdAt: Date;
  updatedAt: Date;
}

export interface Portfolio {
  id: string;
  userId: string;
  name: string;
  totalValue: number;
  totalInvested: number;
  totalReturn: number;
  returnPercentage: number;
  riskLevel: 'conservative' | 'moderate' | 'aggressive';
  createdAt: Date;
  updatedAt: Date;
}

export interface Investment {
  id: string;
  portfolioId: string;
  assetId: string;
  userId: string;
  amount: number;
  quantity: number;
  entryPrice: number;
  currentPrice: number;
  currentValue: number;
  unrealizedGain: number;
  unrealizedGainPercent: number;
  status: 'pending' | 'active' | 'sold' | 'cancelled';
  transactionHash?: string;
  createdAt: Date;
  updatedAt: Date;
}

export interface Transaction {
  id: string;
  userId: string;
  portfolioId?: string;
  assetId?: string;
  type: 'buy' | 'sell' | 'deposit' | 'withdrawal' | 'dividend';
  amount: number;
  quantity?: number;
  price?: number;
  fee: number;
  status: 'pending' | 'completed' | 'failed' | 'cancelled';
  hash?: string;
  description?: string;
  createdAt: Date;
  updatedAt: Date;
}

export interface StakingPool {
  id: string;
  name: string;
  description: string;
  assetId: string;
  apy: number;
  minimumStake: number;
  lockupPeriod: number; // in days
  totalStaked: number;
  maxCapacity: number;
  isActive: boolean;
  createdAt: Date;
  updatedAt: Date;
}

export interface Stake {
  id: string;
  userId: string;
  poolId: string;
  amount: number;
  startDate: Date;
  endDate: Date;
  currentReward: number;
  status: 'active' | 'completed' | 'withdrawn';
  createdAt: Date;
  updatedAt: Date;
}

// API Response types
export interface ApiResponse<T = unknown> {
  success: boolean;
  data?: T;
  error?: string;
  message?: string;
}

export interface PaginatedResponse<T = unknown> extends ApiResponse<T[]> {
  pagination: {
    page: number;
    limit: number;
    total: number;
    totalPages: number;
  };
}

// Contract types for Stellar
export interface TokenMetadata {
  name: string;
  symbol: string;
  decimals: number;
  totalSupply: bigint;
  assetId: string;
}

export interface InvestmentToken {
  address: string;
  assetId: string;
  metadata: TokenMetadata;
  pricePerToken: number;
  totalSupply: number;
  availableSupply: number;
}

// Event types
export interface InvestmentMadeEvent {
  type: 'INVESTMENT_MADE';
  investmentId: string;
  assetId: string;
  userId: string;
  amount: number;
  timestamp: Date;
}

export interface StakeCreatedEvent {
  type: 'STAKE_CREATED';
  stakeId: string;
  poolId: string;
  userId: string;
  amount: number;
  timestamp: Date;
}

export interface TransactionCompletedEvent {
  type: 'TRANSACTION_COMPLETED';
  transactionId: string;
  userId: string;
  transactionType: 'buy' | 'sell' | 'deposit' | 'withdrawal';
  amount: number;
  timestamp: Date;
}

export type DomainEvent =
  | InvestmentMadeEvent
  | StakeCreatedEvent
  | TransactionCompletedEvent;

// Utility types
export type WithTimestamps<T> = T & {
  createdAt: Date;
  updatedAt: Date;
};

export type CreateInput<T> = Omit<T, 'id' | 'createdAt' | 'updatedAt'>;
export type UpdateInput<T> = Partial<CreateInput<T>>;

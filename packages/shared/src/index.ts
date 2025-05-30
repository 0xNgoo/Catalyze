// Core types
export interface User {
    id: string;
    email: string;
    name: string;
    role: 'investor' | 'admin';
    createdAt: Date;
    updatedAt: Date;
}

export interface Investment {
    id: string;
    investorId: string;
    amount: number;
    tokenAddress?: string;
    tokenAmount?: number;
    status: 'pending' | 'active' | 'completed' | 'cancelled';
    expectedReturn: number;
    duration: number; // in months
    createdAt: Date;
    updatedAt: Date;
}

// API Response types
export interface ApiResponse<T = any> {
    success: boolean;
    data?: T;
    error?: string;
    message?: string;
}

export interface PaginatedResponse<T = any> extends ApiResponse<T[]> {
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
}

export interface InvestmentToken {
    address: string;
    metadata: TokenMetadata;
    pricePerToken: number;
    totalSupply: number;
    availableSupply: number;
}

// Utility types
export type WithTimestamps<T> = T & {
    createdAt: Date;
    updatedAt: Date;
};

export type CreateInput<T> = Omit<T, 'id' | 'createdAt' | 'updatedAt'>;
export type UpdateInput<T> = Partial<CreateInput<T>>; 
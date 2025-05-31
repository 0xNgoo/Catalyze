// Date utilities
export const formatDate = (date: Date): string => {
    return date.toLocaleDateString('en-US', {
        year: 'numeric',
        month: 'long',
        day: 'numeric',
    });
};

export const formatCurrency = (amount: number, currency = 'USD'): string => {
    return new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency,
    }).format(amount);
};

// String utilities
export const slugify = (text: string): string => {
    return text
        .toLowerCase()
        .replace(/[^\w\s-]/g, '')
        .replace(/[\s_-]+/g, '-')
        .replace(/^-+|-+$/g, '');
};

export const capitalize = (text: string): string => {
    return text.charAt(0).toUpperCase() + text.slice(1).toLowerCase();
};

// Number utilities
export const clamp = (value: number, min: number, max: number): number => {
    return Math.min(Math.max(value, min), max);
};

export const percentage = (value: number, total: number): number => {
    return total === 0 ? 0 : (value / total) * 100;
};

// Array utilities
export const chunk = <T>(array: T[], size: number): T[][] => {
    const chunks: T[][] = [];
    for (let i = 0; i < array.length; i += size) {
        chunks.push(array.slice(i, i + size));
    }
    return chunks;
};

export const unique = <T>(array: T[]): T[] => {
    return [...new Set(array)];
};

// Validation utilities
export const isEmail = (email: string): boolean => {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
};

export const isPhoneNumber = (phone: string): boolean => {
    const phoneRegex = /^\+?[\d\s-()]+$/;
    return phoneRegex.test(phone);
}; 
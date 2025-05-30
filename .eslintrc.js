module.exports = {
    root: true,
    env: {
        browser: true,
        es2022: true,
        node: true,
    },
    extends: [
        'eslint:recommended',
        'prettier',
    ],
    parser: '@typescript-eslint/parser',
    parserOptions: {
        ecmaVersion: 'latest',
        sourceType: 'module',
        ecmaFeatures: {
            jsx: true,
        },
    },
    plugins: ['@typescript-eslint'],
    rules: {
        '@typescript-eslint/no-unused-vars': ['error', { argsIgnorePattern: '^_' }],
        '@typescript-eslint/no-explicit-any': 'warn',
        'prefer-const': 'error',
        'no-var': 'error',
    },
    overrides: [
        {
            files: ['*.ts', '*.tsx'],
            extends: [
                'eslint:recommended',
                '@typescript-eslint/recommended',
                'prettier',
            ],
        },
        {
            files: ['*.tsx', '*.jsx'],
            extends: ['plugin:react/recommended', 'plugin:react-hooks/recommended'],
            plugins: ['react', 'react-hooks'],
            settings: {
                react: {
                    version: 'detect',
                },
            },
            rules: {
                'react/react-in-jsx-scope': 'off',
                'react/prop-types': 'off',
            },
        },
    ],
}; 
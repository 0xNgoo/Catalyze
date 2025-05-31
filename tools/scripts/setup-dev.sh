#!/bin/bash

set -e

echo "🚀 Setting up Catalyze development environment..."

# Check if pnpm is installed
if ! command -v pnpm &> /dev/null; then
    echo "❌ pnpm is not installed. Please install pnpm first:"
    echo "npm install -g pnpm"
    exit 1
fi

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker first."
    exit 1
fi

# Install dependencies
echo "📦 Installing dependencies..."
pnpm install

# Copy environment file if it doesn't exist
if [ ! -f .env ]; then
    echo "📋 Creating .env file from template..."
    cp env.example .env
    echo "✏️  Please edit .env file with your configuration"
fi

# Start Docker services
echo "🐳 Starting Docker services..."
docker-compose up -d postgres redis

# Wait for services to be ready
echo "⏳ Waiting for services to start..."
sleep 10

# Build packages
echo "🔨 Building shared packages..."
pnpm --filter @catalyze/shared build
pnpm --filter @catalyze/utils build
pnpm --filter @catalyze/config build

echo "✅ Development environment setup complete!"
echo ""
echo "🎯 Next steps:"
echo "  1. Edit .env file with your configuration"
echo "  2. Run 'pnpm dev' to start all applications"
echo "  3. Visit http://localhost:3000 for the web app"
echo ""
echo "🛠️  Available commands:"
echo "  pnpm dev       - Start all applications"
echo "  pnpm build     - Build all applications"
echo "  pnpm lint      - Run linting"
echo "  pnpm format    - Format code" 
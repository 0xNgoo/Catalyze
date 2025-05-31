# Catalyze

[![WIP](https://img.shields.io/badge/Status-Work%20In%20Progress-yellow)](https://github.com/Apple/catalyse)
[![Powered By](https://img.shields.io/badge/Powered%20By-Stellar%20Blockchain-blue)](https://stellar.org)

A mobile micro-investment platform designed to provide accessible investment
opportunities in cryptocurrencies and tokenized assets, primarily targeting
users in emerging markets.

## Overview

Catalyze aims to foster financial inclusion by allowing users to invest small
amounts of money, manage their portfolios, and learn about financial markets.
The platform is built with a focus on accessibility, performance on low-end
devices, and robust offline capabilities.

## Problem Statement

In emerging markets, millions of people remain excluded from traditional
investment opportunities due to:

- **High Minimum Investment Requirements**: Conventional investment platforms
  require amounts that are out of reach for many.
- **Limited Access to Financial Services**: Many are unbanked or underbanked
  with few pathways to build wealth.
- **Complex User Interfaces**: Existing crypto platforms are too technical and
  intimidating for beginners.
- **Device & Connectivity Limitations**: Many users rely on low-end smartphones
  with unreliable internet connections.
- **Financial Literacy Barriers**: Lack of accessible education about investing
  and financial concepts.
- **Trust Deficit**: Uncertainty and mistrust in financial systems, especially
  digital ones.

Catalyze addresses these challenges directly by providing a secure, accessible
micro-investment platform that works on low-end devices, functions offline,
educates users, and enables investments with minimal amounts of capital through
the Stellar blockchain.

## Key Features

- **Micro-Investments**: Invest very small sums of money in cryptocurrencies and
  tokenized assets
- **Staking Pools**: Access and invest in various staking pools directly through
  the app
- **Portfolio Management**: Track investments and monitor performance
- **Offline-First Capabilities**: Core features available without internet
  connection
- **Financial Education**: In-app learning resources to improve financial
  literacy
- **Gamification**: Points, badges, and rewards to encourage consistent
  investment habits
- **Multi-language Support**: Accessible in multiple local languages
- **Fiat On/Off Ramps**: Deposit and withdraw using local payment methods

## Monorepo Architecture

This project uses a monorepo structure with pnpm workspaces to house all
applications and shared packages:

```
catalyze/
├── apps/
│   ├── backend/          # Hono.js API server
│   ├── contracts/        # Stellar Soroban smart contracts
│   ├── landing/          # Vite landing page
│   ├── mobile/           # Expo React Native app
│   └── web/              # Next.js web application
├── packages/
│   ├── shared/           # Shared TypeScript definitions
│   ├── ui/               # Shared React components
│   ├── utils/            # Shared utility functions
│   └── config/           # Shared configuration
├── tools/                # Build tools and scripts
└── docs/                 # Documentation
```

## Tech Stack

- **Package Manager**: pnpm with workspaces
- **Frontend**: React Native (iOS & Android)
- **Backend**: Node.js with Hono framework
- **Database**:
  - PostgreSQL for primary data storage
  - SQLite for offline capabilities
- **Smart Contracts**: Stellar Soroban
- **Landing Page**: Vite + React + TypeScript
- **Web App**: Next.js 14+ with App Router
- **Styling**: Tailwind CSS
- **Type Safety**: TypeScript across all applications
- **Development**: Monorepo structure for streamlined development

## Development Setup

### Prerequisites

- Node.js 18+
- pnpm 8+
- Docker & Docker Compose (for local database)

### Installation

1. Clone the repository:

```bash
git clone https://github.com/0xNgoo/Catalyze.git
cd Catalyze
```

2. Install dependencies:

```bash
pnpm install
```

3. Set up environment variables:

```bash
cp env.example .env
# Edit .env with your configuration
```

4. Start the local database:

```bash
docker-compose up -d postgres redis
```

### Development Commands

- `pnpm dev` - Start all applications in development mode
- `pnpm build` - Build all applications
- `pnpm test` - Run tests across all packages
- `pnpm lint` - Run ESLint across all packages
- `pnpm format` - Format code with Prettier
- `pnpm type-check` - Run TypeScript type checking
- `pnpm clean` - Clean all build artifacts

Or start individual applications:

```bash
pnpm --filter @catalyze/backend dev
pnpm --filter @catalyze/web dev
pnpm --filter @catalyze/mobile dev
```

## Development Roadmap

### Phase 1: Project Setup and Foundation

- [x] Initial requirements gathering and documentation
- [x] Monorepo structure setup with shared configurations
- [ ] CI/CD pipeline implementation
- [x] Development environment setup
- [ ] Core architectural decisions and technical specifications

### Phase 2: Landing Page & Web Presence

- [ ] Design and development of marketing website
- [ ] SEO optimization and analytics integration
- [ ] Documentation site for developers
- [ ] Blog setup for project updates and financial education content
- [ ] Deployment and monitoring infrastructure

### Phase 3: Smart Contract Development & Blockchain Integration

- [ ] Stellar blockchain contract architecture design
- [ ] Wallet management implementation (custodial)
- [ ] Key export functionality
- [ ] Staking pool integration contracts
- [ ] Smart contract security audits
- [ ] Testnet deployment and testing

### Phase 4: Mobile App Core Development

- [ ] React Native app architecture and foundation
- [ ] User registration and authentication
- [ ] KYC integration
- [ ] Offline-first database implementation
- [ ] Portfolio view and management
- [ ] Basic transaction capabilities
- [ ] UI/UX development for low-end devices

### Phase 5: Financial Features & Integrations

- [ ] Fiat on/off ramp integration
- [ ] Local payment gateway connections
- [ ] Crypto asset marketplace
- [ ] Investment functionality
- [ ] Staking pool interface
- [ ] Transaction history and reporting

### Phase 6: Enhanced Features & Education

- [ ] Gamification elements implementation
- [ ] Educational content creation and integration
- [ ] AI-powered risk analysis
- [ ] Crypto sentiment indicators
- [ ] Push notification system
- [ ] Multi-language support

### Phase 7: Admin Web Application

- [ ] Admin dashboard development
- [ ] User management interface
- [ ] Transaction monitoring
- [ ] Content management system
- [ ] Analytics and reporting tools
- [ ] Compliance monitoring tools

### Phase 8: Testing, Security & Launch

- [ ] Comprehensive testing across devices
- [ ] Security audits and penetration testing
- [ ] Performance optimization
- [ ] Beta testing program
- [ ] Regulatory compliance review
- [ ] Public launch preparation
- [ ] Marketing and user acquisition campaign

## Contributing

We welcome contributions to Catalyze! This project uses the OnlyDust platform to
manage contributions and reward contributors.

### How to Contribute

1. **Find an Issue**: Browse our project on
   [OnlyDust](https://app.onlydust.com/projects/catalyze) to find open issues
   that match your skills and interests.

2. **Fork and Clone**: Fork this repository and clone it to your local machine.

3. **Create a Branch**: Create a branch for your contribution.

4. **Make Changes**: Implement your solution following our coding standards and
   practices.

5. **Test**: Ensure your changes pass all tests and add new tests if necessary.

6. **Submit a Pull Request**: Push your changes to your fork and submit a pull
   request to our repository.

### OnlyDust Platform

We use [OnlyDust](https://app.onlydust.com/projects/catalyze) to:

- Track open contributions
- Manage contribution assignments
- Reward contributors for their work
- Build a community of developers

To get started, create an account on OnlyDust and check out our project page to
see available tasks and how to claim them.

### Code of Conduct

Please follow our code of conduct when participating in our community. Be
respectful, inclusive, and collaborative.

## License

This project is licensed under the GNU General Public License v3.0 (GPL-3.0) -
see the LICENSE file for details.

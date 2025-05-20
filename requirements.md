# Product Requirements Document: Mobile Micro-Investment Platform

**Version:** 1.0 **Date:** May 19, 2025

## 1. Introduction

### 1.1. Purpose

This document outlines the product requirements for a mobile micro-investment
application designed to provide accessible and user-friendly investment
opportunities in cryptocurrencies and tokenized assets, primarily targeting
users in emerging markets. The platform aims to foster financial inclusion by
allowing users to invest small amounts of money, manage their portfolios, and
learn about financial markets.

### 1.2. Product Overview

The application will be a mobile-first platform built with a React Native
frontend and a Node.js (Hono) backend. It will feature robust offline
capabilities using SQLite and rely on PostgreSQL for primary data storage. The
platform will enable users to deposit local currencies, invest in a variety of
crypto assets and staking pools, track their investments, and benefit from
gamified engagement and educational resources. A key focus will be on
simplicity, security, and accessibility for users with varying levels of
financial literacy and on low-end smartphones. Development will be managed
within a monorepo structure.

### 1.3. Goals and Objectives

- **Foster Financial Inclusion:** Provide accessible and affordable investment
  avenues for underserved populations.
- **Enable Micro-Investments:** Allow users to invest very small sums of money.
- **Simplify Crypto Access:** Make cryptocurrency and tokenized asset investment
  easy and intuitive.
- **Promote Financial Literacy:** Educate users about investing and blockchain
  technology.
- **Ensure Accessibility:** Design for usability on low-end smartphones and for
  users with low literacy levels.
- **Provide Security and Trust:** Implement robust security measures to protect
  user funds and data.
- **Engage Users:** Incorporate gamification to encourage consistent investment
  and learning.

## 2. Target Audience

- **Primary:** Young adults (18-35 years old) in emerging markets (e.g.,
  Sub-Saharan Africa, Southeast Asia, Latin America).
- **Characteristics:**
  - Have mobile access, often with low-end smartphones and potentially
    unreliable internet connectivity.
  - Limited disposable income, seeking affordable investment opportunities.
  - May be unbanked or underbanked.
  - Varying levels of financial and digital literacy.
  - Interested in blockchain and crypto but may be intimidated by complex
    platforms.

## 3. Proposed Solution

The solution is a comprehensive mobile application that includes:

- **Frontend:** A React Native mobile application ensuring cross-platform
  compatibility (iOS and Android) and optimized for performance on low-end
  devices.
- **Backend:** A Node.js backend built with the Hono framework, providing a
  scalable and secure API for the mobile application.
- **Database:**
  - PostgreSQL: For primary storage of user accounts, transaction data, and
    other relational information requiring ACID compliance.
  - SQLite: Integrated into the React Native application for robust
    offline-first capabilities, allowing users to access essential data and
    queue actions without an internet connection.
- **Blockchain Interaction:** The backend will manage interactions with various
  blockchains for asset management, staking, and fetching pool data. Wallet
  management will be custodial, with an option for users to export their keys.
- **Monorepo:** A monorepo will be used to manage the codebase for the frontend,
  backend, and any shared libraries, facilitating streamlined development and
  CI/CD processes.

## 4. Functional Requirements

### 4.1. User Account Management

| ID    | Requirement              | Priority | Details                                                                                                      | Source Documents Reference                |
| :---- | :----------------------- | :------- | :----------------------------------------------------------------------------------------------------------- | :---------------------------------------- |
| FR-01 | User Registration        | Must     | Users can sign up using Email/Password and Google Sign-In.                                                   | Catalyse                                  |
| FR-02 | User Login               | Must     | Secure login mechanism with support for biometric authentication (if available on device).                   | Catalyse, Spike (Sec. VIII.B - Biometric) |
| FR-03 | Password Recovery        | Must     | Secure process for users to reset their passwords.                                                           | Standard Practice                         |
| FR-04 | Know Your Customer (KYC) | Must     | Users must be able to complete a KYC process for AML compliance. Integration with third-party KYC providers. | Catalyse, Spike (Sec. IX.D)               |
| FR-05 | Profile Management       | Should   | Users can view and update their profile information (e.g., name, contact details, preferences).              | Standard Practice                         |

### 4.2. Wallet Management

| ID    | Requirement                              | Priority | Details                                                                                                                                                      | Source Documents Reference                                   |
| :---- | :--------------------------------------- | :------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------- | :----------------------------------------------------------- |
| FR-06 | Wallet Creation & Management (Custodial) | Must     | The platform will create and manage wallets for users. The backend will securely handle private keys.                                                        | Catalyse                                                     |
| FR-07 | Key Export                               | Should   | Users should have the option to export their private keys if they wish to manage their wallets non-custodially. Clear warnings about risks must be provided. | Catalyse                                                     |
| FR-08 | View Balances                            | Must     | Users can view their crypto asset balances, including fractional amounts, clearly displayed with their local currency equivalent.                            | Catalyse, Spike (Sec. VIII.B - Displaying Micro-Investments) |
| FR-09 | Transaction History                      | Must     | Users can view a detailed history of all their transactions (deposits, withdrawals, investments, rewards).                                                   | Spike (Sec. III.D - SQLite for history)                      |

### 4.3. Fiat On/Off Ramps

| ID    | Requirement                        | Priority | Details                                                                                                                                                              | Source Documents Reference  |
| :---- | :--------------------------------- | :------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------------------------- |
| FR-10 | Deposit Local Currency             | Must     | Integration with local payment gateways (e.g., mobile money, bank transfers) for users to deposit funds into their accounts. Modular design for adding new gateways. | Catalyse, Spike (Sec. IV.C) |
| FR-11 | Withdraw to Local Currency         | Must     | Users can withdraw funds from their platform account to their local bank accounts or mobile money services.                                                          | Catalyse, Spike (Sec. IV.C) |
| FR-12 | Transaction Status Tracking (Fiat) | Must     | Users can track the status of their fiat deposit and withdrawal transactions.                                                                                        | Spike (Sec. IV.C)           |

### 4.4. Crypto Asset Investment

| ID    | Requirement                                    | Priority | Details                                                                                                                                                             | Source Documents Reference        |
| :---- | :--------------------------------------------- | :------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :-------------------------------- |
| FR-13 | Browse Crypto Assets                           | Must     | Users can browse a list of available cryptocurrencies and tokenized assets for investment, with details like current price, historical performance (simple charts). | Catalyse, Spike (Sec. II.B)       |
| FR-14 | Micro-Investments in Crypto & Tokenized Assets | Must     | Users can invest small amounts (e.g., starting from $1 or local equivalent) in selected assets. Support for fractional shares/tokens.                               | Catalyse, Spike (Sec. II.B, VI.B) |
| FR-15 | Purchase Crypto Assets                         | Must     | Users can purchase crypto assets using their deposited fiat balance. Clear display of fees and conversion rates.                                                    | Catalyse                          |
| FR-16 | Sell Crypto Assets                             | Must     | Users can sell their crypto assets, converting them back to fiat balance within the app.                                                                            | Catalyse                          |
| FR-17 | Curated Portfolios                             | Should   | Offer pre-defined, curated portfolios for beginners (e.g., "Starter Diversified Fund").                                                                             | Catalyse                          |

### 4.5. Staking and Rewards

| ID    | Requirement              | Priority | Details                                                                                                                   | Source Documents Reference |
| :---- | :----------------------- | :------- | :------------------------------------------------------------------------------------------------------------------------ | :------------------------- |
| FR-18 | Staking Pool Aggregation | Must     | The app aggregates and displays staking pools from different protocols.                                                   | Catalyse                   |
| FR-19 | Invest in Staking Pools  | Must     | Users can stake their crypto assets in available pools directly through the app.                                          | Catalyse                   |
| FR-20 | View Staking Rewards     | Must     | Users can view rewards earned from staking, including accrual rates and payout history.                                   | Catalyse                   |
| FR-21 | Unstake Assets           | Must     | Users can unstake their assets from pools, subject to the respective pool's terms and conditions (e.g., lock-up periods). | Standard Practice          |

### 4.6. Portfolio Management

| ID    | Requirement                | Priority | Details                                                                                               | Source Documents Reference    |
| :---- | :------------------------- | :------- | :---------------------------------------------------------------------------------------------------- | :---------------------------- |
| FR-22 | View Portfolio Overview    | Must     | Users can see an overview of their total investment value, asset allocation, and overall performance. | Catalyse, Spike (Sec. VIII.B) |
| FR-23 | Asset Performance Tracking | Must     | Users can track the performance of individual assets within their portfolio.                          | Standard Practice             |

### 4.7. Gamification

| ID    | Requirement                  | Priority | Details                                                                                                                                                                 | Source Documents Reference   |
| :---- | :--------------------------- | :------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------- |
| FR-24 | Points and Badges System     | Should   | Award points and badges for completing specific actions (e.g., first investment, consistent saving, completing educational modules). Backend (Node.js) to manage logic. | Catalyse, Spike (Sec. VII.A) |
| FR-25 | Progress Bars and Milestones | Should   | Visual progress bars for investment goals or learning paths (e.g., "You’re 10% closer to owning a full share!").                                                        | Catalyse                     |
| FR-26 | Leaderboards (Optional)      | Could    | Anonymous leaderboards to foster friendly competition (if deemed appropriate for the target audience and goals).                                                        | Spike (Sec. VII.A)           |
| FR-27 | Rewards for Engagement       | Should   | Provide small incentives (e.g., platform utility tokens, if applicable, or symbolic rewards) for achievements like referrals or consistent investing.                   | Catalyse                     |

### 4.8. Educational Content

| ID    | Requirement                         | Priority | Details                                                                                                                                                         | Source Documents Reference  |
| :---- | :---------------------------------- | :------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------------------------- |
| FR-28 | In-App Learning Hub                 | Should   | Provide tutorials, articles, and short videos explaining investment concepts, blockchain technology, and platform features in simple terms and local languages. | Catalyse, Spike (Sec. II.B) |
| FR-29 | Practice Mode (Simulated Investing) | Could    | Allow users to practice investing with virtual money to understand platform mechanics without real financial risk.                                              | Catalyse                    |

### 4.9. AI-Powered Features

| ID    | Requirement                | Priority | Details                                                                                                                                                                     | Source Documents Reference |
| :---- | :------------------------- | :------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------- |
| FR-30 | AI for Risk Analysis       | Should   | Provide AI-driven risk analysis insights for staking pools or investment options (e.g., simplified risk scores, potential volatility indicators). Backend to host AI model. | Catalyse                   |
| FR-31 | Crypto Sentiment Indicator | Should   | Display a general crypto market sentiment indicator within the app.                                                                                                         | Catalyse                   |

### 4.10. Notifications

| ID    | Requirement        | Priority | Details                                                                                                                                                             | Source Documents Reference              |
| :---- | :----------------- | :------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :-------------------------------------- |
| FR-32 | Push Notifications | Must     | Send push notifications for important events: transaction confirmations, investment milestones, market updates (opt-in), new asset/pool offerings, security alerts. | Catalyse, Spike (Sec. IV.A - Real-time) |

### 4.11. Social Impact

| ID    | Requirement                       | Priority | Details                                                                                                      | Source Documents Reference |
| :---- | :-------------------------------- | :------- | :----------------------------------------------------------------------------------------------------------- | :------------------------- |
| FR-33 | Social Impact Tracking (Optional) | Could    | If applicable, highlight investments that contribute to local community projects or sustainable initiatives. | Catalyse                   |

## 5. Non-Functional Requirements

### 5.1. Performance

| ID     | Requirement                  | Priority | Details                                                                                                                                                                                      | Source Documents Reference           |
| :----- | :--------------------------- | :------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----------------------------------- |
| NFR-01 | Application Responsiveness   | Must     | The React Native app must be responsive with smooth navigation and quick load times, even on low-end devices. Target <200ms for interactions. API response times <500ms for most operations. | Spike (Sec. III.C, VIII.A)           |
| NFR-02 | Low-End Device Compatibility | Must     | Optimized for performance (CPU, memory, battery) on common low-specification smartphones prevalent in emerging markets.                                                                      | Catalyse, Spike (Sec. III.C, VIII.A) |
| NFR-03 | App Size Optimization        | Must     | Keep the initial download size of the React Native app as small as possible. Employ techniques like code splitting, optimized assets, and ProGuard/R8 for Android, App Thinning for iOS.     | Spike (Sec. III.E)                   |
| NFR-04 | Efficient Data Handling      | Must     | Minimize data consumption through efficient API payloads, caching, and delta updates for offline sync.                                                                                       | Spike (Sec. III.D - Delta Syncing)   |

### 5.2. Scalability

| ID     | Requirement          | Priority | Details                                                                                                                                                            | Source Documents Reference |
| :----- | :------------------- | :------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------- |
| NFR-05 | Backend Scalability  | Must     | The Node.js (Hono) backend must be designed to scale horizontally to handle a growing number of users and transactions. Utilize stateless services where possible. | Spike (Sec. IV.A, X.B)     |
| NFR-06 | Database Scalability | Must     | PostgreSQL database should support scaling strategies like read replicas. Connection pooling must be implemented.                                                  | Spike (Sec. V.A, X.B)      |

### 5.3. Security

| ID     | Requirement                               | Priority | Details                                                                                                                                                                                         | Source Documents Reference                               |
| :----- | :---------------------------------------- | :------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------- |
| NFR-07 | Secure API Communication                  | Must     | All API communication between the React Native app and Node.js backend must use HTTPS/TLS.                                                                                                      | Spike (Sec. IV.B)                                        |
| NFR-08 | Authentication and Authorization          | Must     | Implement robust authentication (e.g., JWTs, OAuth 2.0) and role-based access control (RBAC) for backend APIs.                                                                                  | Spike (Sec. IV.B)                                        |
| NFR-09 | Data Encryption                           | Must     | Sensitive user data (PII, financial information) must be encrypted at rest (PostgreSQL TDE or column-level encryption, SQLite encryption using SQLCipher) and in transit (HTTPS).               | Spike (Sec. IX.A, IX.C)                                  |
| NFR-10 | Secure Wallet Key Management (Custodial)  | Must     | Private keys managed by the backend must be stored using industry-best practices for security, including HSMs or equivalent secure enclave technology if feasible, and strict access controls.  | Catalyse, Spike (Sec. IX.B - Operational Key Management) |
| NFR-11 | Protection Against Common Vulnerabilities | Must     | Adhere to OWASP Mobile Top 10 and OWASP Web Top 10 security practices for frontend and backend development respectively. Implement input validation rigorously.                                 | Spike (Sec. IX.A)                                        |
| NFR-12 | Secure Local Storage (Offline)            | Must     | Sensitive data cached on the device (e.g., API tokens in SQLite) must be encrypted using secure storage mechanisms provided by React Native or underlying native platforms (Keystore/Keychain). | Spike (Sec. III.D, IX.A)                                 |
| NFR-13 | AML Compliance                            | Must     | System must support AML procedures, primarily through KYC and transaction monitoring capabilities.                                                                                              | Catalyse, Spike (Sec. IX.D)                              |
| NFR-14 | Regular Security Audits                   | Should   | Plan for periodic penetration testing and security audits of the platform.                                                                                                                      | Spike (Sec. IX.A)                                        |

### 5.4. Usability and Accessibility

| ID     | Requirement                            | Priority | Details                                                                                                                                                                                     | Source Documents Reference                    |
| :----- | :------------------------------------- | :------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :-------------------------------------------- |
| NFR-15 | Intuitive User Interface (UI)          | Must     | Clean, simple, and visually appealing UI. Easy navigation, large tappable targets, and clear calls to action. Minimize text and use universally understood icons.                           | Catalyse, Spike (Sec. VIII.B)                 |
| NFR-16 | Low-Literacy User Support              | Must     | Use plain language, avoid jargon. Provide visual cues and feedback. Consider voice assistance (TTS for key information, STT for input) for core functionalities.                            | Catalyse, Spike (Sec. VIII.B)                 |
| NFR-17 | Multilingual Support                   | Must     | The app must support multiple local languages relevant to the target emerging markets.                                                                                                      | Catalyse, Spike (Sec. VIII.B)                 |
| NFR-18 | Accessibility Standards                | Must     | Adhere to mobile accessibility guidelines (e.g., WCAG AA for mobile where applicable). Support for screen readers (VoiceOver, TalkBack), dynamic font sizes, and sufficient color contrast. | Spike (Sec. VIII.B - Framework-Specific APIs) |
| NFR-19 | Clear Display of Financial Information | Must     | Fractional shares and micro-investment values must be displayed with utmost clarity, always accompanied by their local currency equivalent.                                                 | Spike (Sec. VIII.B)                           |

### 5.5. Reliability and Availability

| ID     | Requirement                 | Priority | Details                                                                                                                                                                                                 | Source Documents Reference   |
| :----- | :-------------------------- | :------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :--------------------------- |
| NFR-20 | Offline-First Functionality | Must     | Core features (e.g., viewing portfolio, cached educational content, queueing transactions) must be available offline. Data syncs automatically when connectivity is restored. SQLite for local storage. | Catalyse, Spike (Sec. III.D) |
| NFR-21 | Data Integrity              | Must     | Ensure accuracy and consistency of financial data. PostgreSQL ACID compliance for backend. Robust conflict resolution for offline data synchronization.                                                 | Spike (Sec. III.D, V.A)      |
| NFR-22 | High Availability (Backend) | Should   | Backend services should aim for high availability (e.g., 99.9% uptime) through redundant infrastructure and failover mechanisms.                                                                        | Spike (Sec. V.A, X.A)        |
| NFR-23 | Robust Error Handling       | Must     | Graceful error handling in both app and backend, with clear, user-friendly messages.                                                                                                                    | Spike (Sec. IV.B)            |

### 5.6. Maintainability

| ID     | Requirement            | Priority | Details                                                                                                                                        | Source Documents Reference                            |
| :----- | :--------------------- | :------- | :--------------------------------------------------------------------------------------------------------------------------------------------- | :---------------------------------------------------- |
| NFR-24 | Monorepo Structure     | Must     | Utilize a monorepo for managing frontend (React Native), backend (Node.js/Hono), and shared code/types.                                        | User Specified                                        |
| NFR-25 | Code Quality           | Must     | Well-documented, modular, and testable code. Adherence to coding standards and best practices for React Native, Node.js, TypeScript (if used). | Standard Practice                                     |
| NFR-26 | Comprehensive Testing  | Must     | Unit, integration, and end-to-end tests for both frontend and backend.                                                                         | Spike (Sec. IX.B - Smart Contract Testing, adaptable) |
| NFR-27 | Logging and Monitoring | Must     | Implement comprehensive logging and monitoring for backend services and critical app events to facilitate debugging and operational oversight. | Spike (Sec. X.B)                                      |

### 5.7. Regulatory Compliance

| ID     | Requirement                      | Priority | Details                                                                                                                                                      | Source Documents Reference |
| :----- | :------------------------------- | :------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------- |
| NFR-28 | Data Privacy                     | Must     | Comply with relevant data privacy regulations in target markets (e.g., GDPR principles, local laws). Obtain user consent for data collection and processing. | Spike (Sec. IX.C, IX.D)    |
| NFR-29 | Data Sovereignty (if applicable) | Should   | Architecture should allow for data storage in specific geographic regions if required by local regulations.                                                  | Spike (Sec. IX.D)          |

## 6. Data Management (Offline-First Focus)

- **Local Storage (SQLite):**
  - User profile data (non-sensitive parts).
  - Cached portfolio information and investment balances.
  - Transaction history.
  - Educational content (text, metadata for videos).
  - User preferences and application settings.
  - Queue for actions performed offline (e.g., investment requests).
- **Secure Storage (Device Keychain/Keystore via React Native):**
  - API authentication tokens.
  - Encrypted user session data.
- **Data Synchronization:**
  - **Connectivity Detection:** The React Native app will detect network status
    changes.
  - **Background Sync:** Utilize React Native background task capabilities to
    sync data when the app is not in the foreground and connectivity is
    available.
  - **Incremental/Delta Syncing:** APIs will support fetching only changed data
    since the last sync to minimize data usage.
  - **Conflict Resolution:** Implement a "last write wins" (client or server
    priority based on business rule) or a more sophisticated conflict resolution
    strategy for data modified both offline and on the server. Server-side
    validation is critical for financial transactions.

## 7. Monorepo Strategy

A monorepo (e.g., using tools like Nx, Lerna, or Yarn Workspaces) will be
adopted to manage the codebase. This will include:

- React Native application code.
- Node.js (Hono) backend API code.
- Shared libraries/utilities (e.g., data models/types, validation logic) used by
  both frontend and backend. This approach aims to improve code sharing,
  maintain consistency, simplify dependency management, and streamline the build
  and deployment process.

## 8. Future Considerations (From Spike Document, adapted)

- **Advanced AI/ML Integration:**
  - Personalized financial advice (requires regulatory review).
  - Enhanced fraud detection.
- **Expansion of Tokenized Assets:** Support more types of Real-World Assets
  (RWAs).
- **Deeper DeFi Integrations:** Explore connections with lending/borrowing
  protocols (with risk assessment).
- **Cross-Chain Interoperability:** Investigate solutions for interacting with
  assets on other blockchains.
- **Dynamic NFTs for Gamification:** More interactive and evolving rewards.
- **Evolving Regulatory Landscape:** Continuously monitor and adapt to changes
  in local payment gateways, KYC/AML requirements, and crypto regulations in
  target markets.

## 9. Assumptions

- The platform will initially focus on a select few cryptocurrencies and
  tokenized assets/staking pools.
- Third-party services will be used for KYC/AML and potentially for some payment
  gateway integrations.
- Users will have access to smartphones capable of running React Native
  applications.
- The initial launch will target specific emerging markets, with language and
  payment options tailored accordingly.

## 10. Open Questions / Items for Clarification

- Specific local payment gateways to prioritize for initial launch.
- Detailed list of cryptocurrencies and types of tokenized assets to be
  supported initially.
- Specific protocols for staking pool aggregation.
- Detailed requirements for AI risk analysis models and crypto sentiment data
  sources.

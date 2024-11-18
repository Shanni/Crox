# Avalanche Cross-Chain Token Transfer Game

This README provides guidance for developing a cross-chain token transfer game on Avalanche using the Avalanche Starter Kit and Avalanche CLI. By leveraging these tools, you can easily spin up two local chains along with a local C-Chain to test this application.

## Overview
I used the Avalanche CLI to create a local Avalanche network with a teleporter-enabled L1.

- **Avalanche CLI**: Create and manage local Avalanche networks.
- **Foundry**:
  - Forge: Compile and deploy smart contracts to your local network, Fuji Testnet, or Mainnet.
  - Cast: Interact with deployed smart contracts.
- **Teleporter**: Contracts for cross-chain interactions.
- **BuilderKit**: A library of UI components for ICTT bridges and cross-chain swaps.


## Starting a Local Avalanche Network

To start a local Avalanche network with your own teleporter-enabled L1, follow these commands. Your network will be independent of the Avalanche Mainnet and Fuji Testnet, featuring its own Primary Network (C-Chain, X-Chain & P-Chain). Note that services available on Fuji (like Chainlink or bridges) will not be accessible.

First, create your L1 configuration. Follow the prompts, and if you don't have specific requirements for precompiles, accept the suggested options. For the Airdrop of the native token, select "Airdrop 1 million tokens to the default ewoq address (do not use in production)". Keep the name "mysubnet" to avoid additional configuration.

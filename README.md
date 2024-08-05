# Smart Contract for Voting

## Overview

This project aims to develop a smart contract on Ethereum for a voting system where the votes are transparent and tamper-proof.

## Prerequisites

The project uses Node.js and npm, which are essential for working with Ethereum development tools. Ensure you have these installed on your system.

## Tools

The following tools are used in this project:

1. **Truffle** - A development environment, testing framework, and asset pipeline for Ethereum.
2. **Ganache** - A personal blockchain for Ethereum development.

## Installation

Before executing the contract, you need to download and install the above tools.

1. Install Truffle:
   ```sh
   npm install -g truffle
   ```
2. Download the Ganache GUI from [Ganache](https://archive.trufflesuite.com/ganache/).

## Setup

1. Open the Ganache application and choose 'Quickstart'. This will create and open a local blockchain.
2. Click on the settings button in the top right corner to open the workspace settings. Under the Truffle projects section, click on the 'Add project' button and select the `truffle-config.js` file located at [truffle-config.js](./truffle-config.js).
3. The Truffle projects section will show that `truffle-config.js` has been added. Click on the restart button in the top right corner to restart the blockchain. It is now ready to deploy the contract.

## Compilation and Deployment

1. Navigate to the workspace directory in the terminal.
2. Compile the contract:
   ```sh
   truffle compile
   ```
3. Deploy the contract:
   ```sh
   truffle migrate
   ```

## Interaction

You can use the Truffle console to interact with the contract on the local blockchain:

```sh
truffle console
```

## Contract Details

The Voting contract is written with Voter and Proposal structs. Each voter needs to be given the right to vote before voting. There are three proposals to vote on - Proposal 1, Proposal 2, Proposal 3. After the contract is compiled, a migration script, 2-deploy-contracts.js located at migrations/2_deploy_contracts.js, migrates the contract onto the local Ganache Ethereum blockchain and deploys it.

## Frontend

The frontend for this project is located in the voting-dapp-frontend directory. It is built using Create React App. The frontend uses the ethers.js framework to help connect the deployed smart contract on the blockchain to the frontend.

### Available Scripts

In the voting-dapp-frontend directory, you can run:

1. Run the app in development mode using

```sh
npm start
```

This will run the app on http://localhost:3000 and it can be viewed in your browser.

## Current Implementation and Problems

The voting contract successfully deploys on the Ganache blockchain and can be interacted with via the Truffle console. However, there is a known issue with the frontend not being able to correctly fetch the contract’s deployed address, which results in an error. For now, the contract’s functionality can be demonstrated using the Truffle console, and Ganache GUI can provide insights into the deployed contract’s status.

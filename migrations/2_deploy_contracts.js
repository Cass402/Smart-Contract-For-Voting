/** This file is a migration script that is used to deploy the
 * Voting smart contract to the Ethereum blockchain. The script
 * is written in JavaScript and uses the Truffle framework to
 * deploy the contract.
 */

// Import the Voting contract
const Voting = artifacts.require("Voting");

// Export the migration function
module.exports = function (deployer) {
  const proposals = ["Proposal 1", "Proposal 2", "Proposal 3"]; // Define the proposals
  deployer.deploy(Voting, proposals); // Deploy the Voting contract with the proposals as arguments
};

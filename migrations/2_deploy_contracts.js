/** This file is a migration script that is used to deploy the
 * Voting smart contract to the Ethereum blockchain. The script
 * is written in JavaScript and uses the Truffle framework to
 * deploy the contract.
 */

// Import the Voting contract
const Voting = artifacts.require("Voting");

// Export the migration function
module.exports = async function (deployer) {
  const proposals = ["Proposal 1", "Proposal 2", "Proposal 3"]; // Define the proposals for the smart contract
  try {
    // Use try...catch to handle errors
    // Deploy the Voting contract
    await deployer.deploy(Voting, proposals);
  } catch (error) {
    console.error("Error in migration: ", error); // Log an error if it occurs
  }
};

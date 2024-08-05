/** This file is used to connect the frontend of the smart contract voting application
 * to the instance of the smart contract deployed on the local ganache blockchain.
 */

// Importing the necessary libraries
import { ethers, JsonRpcProvider } from "ethers"; // Importing ethers library
import Voting from "../contracts/Voting.json"; // Importing the compiled smart contract

// Function to connect to the smart contract deployed on the local ganache blockchain
async function loadContract() {
  const provider = new JsonRpcProvider("http://localhost:7545"); // connecting to the local ganache blockchain
  const signer = provider.getSigner(); // Getting the signer
  const networkID = (await provider.getNetwork()).chainId; // Getting the network ID
  const deployedNetwork = Voting.networks[networkID]; // Getting the deployed network

  // Creating a new instance of the smart contract
  const contract = new ethers.Contract(
    deployedNetwork.address,
    Voting.abi,
    signer
  );

  return contract; // Returning the contract instance
}

// A function to retrieve the proposals from the smart contract "Voting"
async function getProposals(contract) {
  const proposals = []; // An array to store the proposals
  // Looping through the proposals to store them in the array
  for (let i = 0; i < 3; i++) {
    proposals.push(await contract.getProposals(i)); // Getting the proposal at index i
  }

  return proposals; // Returning the proposals array
}

// A function to get the winner of the proposals
async function getWinner(contract) {
  return await contract.winningProposalName(); // Returning the winning proposal name
}

// A export statement to export the functions
export { loadContract, getProposals, getWinner };

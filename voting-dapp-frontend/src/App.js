//** This file is for the frontend of the blockchain smart contract. It uses ethers.js to link the contract to the frontend */

// Importing the necessary libraries
import React, { useState, useEffect } from "react"; // Importing React, useState, and useEffect

// Importing the functions from ethers.js
import { loadContract, getProposals, getWinner } from "./utils/ethers"; // Importing the functions from ethers.js

// The main App component
function App() {
  const [proposals, setProposals] = useState([]); // State variable to store the proposals
  const [winner, setWinner] = useState(""); // State variable to store the winner
  const [contract, setContract] = useState(null); // State variable to store the contract instance

  // useEffect hook to load the contract and proposals
  useEffect(() => {
    // an init function to load the contract and proposals
    async function init() {
      const contractInstance = await loadContract(); // Loading the contract instance
      setContract(contractInstance); // Setting the contract instance in the state

      const proposals = await getProposals(contract); // Getting the proposals
      setProposals(proposals); // Setting the proposals in the state

      const winner = await getWinner(contract); // Getting the winner
      setWinner(winner); // Setting the winner in the state
    }
    init(); // Calling the init function
  }, []);

  // return statement to render the UI
  return (
    <div className="App">
      <h1>Voting Dapp</h1>
      <h2>Proposals:</h2>
      <ul>
        {proposals.map((proposal, index) => (
          <li key={index}>{proposal}</li>
        ))}
      </ul>
      <h2>Winning Proposal:</h2>
      <p>{winner}</p>
    </div>
  );
}

export default App; // Exporting the App component

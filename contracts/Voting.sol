// This file is created for creating a smart contract for voting
// This contract is created for the purpose of the project "Smart Contract for Voting"

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; // Version of solidity compiler to be used

// declaring a contract named Voting
contract Voting {
    
    // declaring a struct named Voter for storing the details of the voter
    struct Voter {
        bool voted; // boolean to check if the voter has voted or not
        uint vote; // uint to store the vote of the voter
    }

    // declaring a struct named Proposal for storing the details of the proposal to be voted on
    struct Proposal {
        string name_of_proposal; // string to store the name of the proposal
        uint voteCount; // uint to store the vote count of the proposal
    }

    address public chairperson; // address of the chairperson of the voting
    mapping(address => Voter) public voters; // mapping to store the details of the voters
    Proposal[] public proposals; // array to store the details of the proposals

    // constructor to initialize the chairperson
    constructor(string[] memory proposalNames) {
        chairperson = msg.sender; // initializing the chairperson with the address of the sender
        voters[chairperson].voted = false; // setting the voted status of the chairperson to false

        // loop to add the proposals to the proposals array
        for (uint i=0; i<proposalNames.length; i++) {
            proposals.push( // pushing the proposal to the proposals array
                Proposal({ // creating a new Proposal object
                name_of_proposal: proposalNames[i], // initializing the name of the proposal
                voteCount: 0 // initializing the vote count of the proposal to 0
            }));
        }    
    }

    function vote(uint proposal) public {
        Voter storage sender = voters[msg.sender]; // storing the details of the sender
    }
}
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
        uint weight; // uint to store the weight of the voter (the right to vote)
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
        voters[chairperson].weight = 1; // giving the right to vote to the chairperson

        // loop to add the proposals to the proposals array
        for (uint i=0; i<proposalNames.length; i++) {
            proposals.push( // pushing the proposal to the proposals array
                Proposal({ // creating a new Proposal object
                name_of_proposal: proposalNames[i], // initializing the name of the proposal
                voteCount: 0 // initializing the vote count of the proposal to 0
            }));
        }    
    }

    // function to give the right to vote to the voter
    function giveRightToVote(address voter) public {
        require(msg.sender == chairperson, "Only chairperson can give right to vote."); // checking if the sender is the chairperson
        require(!voters[voter].voted, "The voter has already voted."); // checking if the voter has already voted
        require(voters[voter].weight == 0, "The voter already has the right to vote."); // checking if the voter already has the right to vote
        voters[voter].weight = 1; // giving the right to vote to the voter
    }

    // function for voting on a proposal by the voter
    function vote(uint proposal) public {
        Voter storage sender = voters[msg.sender]; // storing the details of the sender
        require(sender.weight != 0, "Has no right to vote."); // checking if the sender has the right to vote
        require(!sender.voted, "Already voted."); // checking if the sender has already voted
        sender.voted = true; // setting the voted status of the sender to true
        sender.vote = proposal; // storing the vote of the sender
        proposals[proposal].voteCount += sender.weight; // incrementing the vote count of the proposal according to the weight of the sender
    }

    function winningProposal() public view returns (uint winning_proposal) {
        uint winningVoteCount = 0; // initializing the winning vote count to 0
        for (uint p=0; p<proposals.length; p++){ // loop to iterate over the proposals
            if (proposals[p].voteCount > winningVoteCount) { // checking if the vote count of the proposal is greater than the winning vote count
                winningVoteCount = proposals[p].voteCount; // updating the winning vote count
                winning_proposal = p; // updating the winning proposal
            }
        }
    }

    // function to get the name of the winning proposal
    function winningProposalName() public view returns (string memory winning_proposal_name) {
        winning_proposal_name = proposals[winningProposal()].name_of_proposal; // getting the name of the winning proposal
    }
}
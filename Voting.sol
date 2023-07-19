pragma solidity ^0.6.4;

contract Voting{
    mapping (bytes32 => uint256) public votesReceived;

    bytes32[] public candidateList;

    constructor (bytes32[] memory candidateNames) public {
        // candidateNames will be provided while deployment
        candidateList = candidateNames;
    }

    function totalVotesFor(bytes32 candidate) view public returns (uint256) {
        require(validCandidate(candidate));
        return votesReceived[candidate];
    }

    function voteForCandidate(bytes32 candidate) public {
        require(validCandidate(candidate));
        votesReceived[candidate] += 1;
    }

    function validCandidate(bytes32 candidate) view public returns (bool) {
        for (uint i = 0; i< candidateList.length; i++) {
            if (candidateList[i] == candidate) {
                return true;
            }
        }
        return false;
    }
}

//0xe0584bBE30C29Bb64217aCe18D7bD65635Dbdb9C = smart contract address
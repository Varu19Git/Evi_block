// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EvidenceTracker {
    struct Evidence {
        string hash;
        uint256 timestamp;
        address owner;
    }

    Evidence[] public evidences;
    mapping(string => bool) public hashExists;

    event EvidenceAdded(uint256 id, string hash, uint256 timestamp, address owner);

    function addEvidence(string memory _hash) public {
        require(!hashExists[_hash], "Evidence already exists");
        evidences.push(Evidence({
            hash: _hash,
            timestamp: block.timestamp,
            owner: msg.sender
        }));
        hashExists[_hash] = true;
        emit EvidenceAdded(evidences.length - 1, _hash, block.timestamp, msg.sender);
    }

    function getEvidence(uint256 _id) public view returns (string memory, uint256, address) {
        Evidence memory evidence = evidences[_id];
        return (evidence.hash, evidence.timestamp, evidence.owner);
    }
}

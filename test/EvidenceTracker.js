const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("EvidenceTracker", function () {
    let EvidenceTracker;
    let evidenceTracker;
    let owner;

    beforeEach(async function () {
        // Get the ContractFactory and Signers
        [owner] = await ethers.getSigners();
        EvidenceTracker = await ethers.getContractFactory("EvidenceTracker");

        // Deploy the contract
        evidenceTracker = await EvidenceTracker.deploy();
        // No need to call .deployed() here
    });

    it("Should add and retrieve evidence", async function () {
        // Add evidence
        await evidenceTracker.addEvidence("QmHash123");

        // Retrieve evidence
        const evidence = await evidenceTracker.getEvidence(0);

        // Assertions
        expect(evidence[0]).to.equal("QmHash123"); // Check hash
        expect(evidence[2]).to.equal(owner.address); // Check owner
    });
});

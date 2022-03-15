const HackPreservation = artifacts.require("HackPreservation");

module.exports = function (deployer, network, accounts) {
   deployer.deploy(HackPreservation);
};

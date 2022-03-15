const SimpleToken = artifacts.require("SimpleToken");
const Recovery = artifacts.require("Recovery");

module.exports = function (deployer, network, accounts) {
  deployer.then(async () => {
    await deployer.deploy(SimpleToken, "testtoken", accounts[0], 1);
    await deployer.deploy(Recovery);
  });
};

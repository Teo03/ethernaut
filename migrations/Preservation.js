const Preservation = artifacts.require("Preservation");
const LibraryContract = artifacts.require("LibraryContract");

module.exports = function (deployer, network, accounts) {
  deployer.then(async () => {
    await deployer.deploy(LibraryContract);
    await deployer.deploy(Preservation, LibraryContract.address, LibraryContract.address);
  });
};

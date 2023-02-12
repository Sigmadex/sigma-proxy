const hre = require("hardhat");

async function main() {
  const SDEX = await hre.ethers.getContractFactory("SDEX");
  const sdex = await SDEX.deploy(
    "SigmaDEX", "SDEX" 
  );
  console.log("SDEX address:", sdex.address);
  await sdex.deployed();
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
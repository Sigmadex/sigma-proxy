const hre = require("hardhat");

async function main() {
  const PROXY = await hre.ethers.getContractFactory("Proxy");
  const proxy = await PROXY.deploy(
    "0xABC4d449e65bA3f2D0C1E9d0E63cD8e333e85671"
  );
  console.log("proxy address:", proxy.address);
  await proxy.deployed();
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
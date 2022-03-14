// Jesus e Senhor
// Dev. 2022 Gleison Silveira
// EXEMPLO DO ARQUIVO DE CONFIRGURAÇÂO do module.exports

require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan")
//.env
//POLYGONSCAN_KEY=API KEY
//PRIVATE_KEY=CHAVE PRIVADA
////////////////////////////////////////
/// npm install dotenv
require("dotenv").config();

task("accounts", "listar contas", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

task("deploy", "Deploy the smart contracts", async(taskArgs, hre) => {

  const Artwork = await hre.ethers.getContractFactory("Artwork");
  const artwork = await Artwork.deploy("Artwork Contract", "ART");

  await artwork.deployed();

  await hre.run("verify:verify", {
    address: artwork.address,
    constructorArguments: [
      "Artwork Contract",
      "ART"
    ]
  })

})

// o arquivo do module.exports deve ser modificado para 
// setar  os servidores da MUMBAI POLYGONSCAN...
// criar conta polygonScan!!
module.exports = {
  solidity: "0.8.4",
  networks: {
    mumbai: {
      url: "https://matic-testnet-archive-rpc.bwarelabs.com",
      accounts: [
        //Chave do arquivo .env
        process.env.PRIVATE_KEY,
      ]
    }
  },
  etherscan: {
         //Chave do arquivo .env
    apiKey: process.env.POLYGONSCAN_KEY,
  }
};

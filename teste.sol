//Utilizar versao 0.8.0 ou 0.8.4
pragma solidity 0.8.4; 
// Instalar ZEPELIN
// npm i @openzeppelin/contracts
// Abrir contrato em REMIX ETHEREUM e Solidity remix.ethereum.org/
// npm i remix-ide
// npm install -g solc
// sudo add-apt-repository ppa:ethereum/ethereum
// sudo add-apt-repository ppa:ethereum/ethereum-dev
// sudo apt-get update
// sudo apt-get install solc
 // sudo snap install solc LINUX DEBIAN
 // ARCHLINUX sudo pacman -S solidity
 // MACOS
 // brew update
 // brew upgrade
 // brew tap ethereum/ethereum
 // brew install solidity
 // brew linkapps solidity
 //brew unlink solidity
 // # Install 0.4.8
 // brew install https://raw.githubusercontent.com/ethereum/homebrew-ethereum/77cce03da9f289e5a3ffe579840d3c5dc0a62717/solidity.rb

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract teste is ERC721 {

    uint256 public tokenCounter;
    mapping (uint256 => string) private _tokenURIs;

    constructor(
        string memory name,
        string memory symbol
    ) ERC721(name, symbol) {
        tokenCounter = 0;
    }

    function mint(string memory _tokenURI) public {
        _safeMint(msg.sender, tokenCounter);
        _setTokenURI(tokenCounter, _tokenURI);

        tokenCounter++;
    }

    function _setTokenURI(uint256 _tokenId, string memory _tokenURI) internal virtual {
        require(
            _exists(_tokenId),
            "ERC721Metadata: URI set of nonexistent token"
        );  //checagem se  token existe
        _tokenURIs[_tokenId] = _tokenURI;
    }

    function tokenURI(uint256 _tokenId) public view virtual override returns(string memory) {
        require(
            _exists(_tokenId),
            "ERC721Metadata: URI set of nonexistent token"
        );
        return _tokenURIs[_tokenId];
    }

}

//Contratos e consumos com HARDHAT e solidty e WALLETS web

contract ERC721 {
    // ------- ERC20 compatible functions -------

    //name
    // Tells outside contracts and apps the name of this token
    //  contract MyNFT {
    //   function name() constant returns (string name){
    //     return "My Non-Fungible Token";
    //   }
    // }
    function name() constant returns (string name);

    // symbol
    // Provides compatability with ERC20
    // Provides outside programs with the tokens shorthand name
    // contract MyNFT {
    //   function symbol() constant returns (string symbol){
    //     return "MNFT";
    //   }
    // }
    function symbol() constant returns (string symbol);

    //totalSupply
    // returns the total number of coins avaliable on the blockchain
    //    contract MyNFT {
    //   // This can be an arbitrary number
    //   uint256 private totalSupply = 1000000000;
    //   function totalSupply() constant returns (uint256 supply){
    //     return totalSupply;
    //   }
    // }
    function totalSupply() constant returns (uint256 totalSupply);

    //balanceOf
    // fund the number of tokens that an address owns
    // contract MyNFT {
    //   mapping(address => uint) private balances;
    //   function balanceOf(address _owner) constant returns (uint balance)
    //   {
    //     return balances[_owner];
    //   }
    // }
    function balanceOf(address _owner) constant returns (uint balance);

    // ------- Functions that define ownership -------
    // Oenership functions define how the contract will handle token ownership
    // and how it can be transfered

    // ownerOf
    // returns the address owner of a token
    // uses unique ID
    //  contract MyNFT {
    //   mapping(uint256 => address) private tokenOwners;
    //   mapping(uint256 => bool) private tokenExists;
    //   function ownerOf(uint256 _tokenId)
    //   constant returns (address owner) {
    //     require(tokenExists[_tokenId]);
    //     return tokenOwners[_tokenId];
    //   }
    // }
    function ownerOf(uint256 _tokenId) constant returns (address owner);

    // approve
    // grants access to another person to transfer a token fro an owner
    //     contract MyNFT {
    //   mapping(address => mapping (address => uint256)) allowed;
    //   function approve(address _to, uint256 _tokenId){
    //     require(msg.sender == ownerOf(_tokenId));
    //     require(msg.sender != _to);
    //     allowed[msg.sender][_to] = _tokenId;
    //     Approval(msg.sender, _to, _tokenId);
    //   }
    // }
    function approve(address _to, uint256 _tokenId);

    // takeOwnership
    // withdraw function when user has been approved to own tokens
    //   contract MyNFT {
    //   function takeOwnership(uint256 _tokenId){
    //     require(tokenExists[_tokenId]);
    //     address oldOwner = ownerOf(_tokenId);
    //     address newOwner = msg.sender;
    //     require(newOwner != oldOwner);
    //     require(allowed[oldOwner][newOwner] == _tokenId);
    //     balances[oldOwner] -= 1;
    //     tokenOwners[_tokenId] = newOwner;
    //     balances[newOwner] += 1;
    //     Transfer(oldOwner, newOwner, _tokenId);
    //   }
    // }
    function takeOwnership(uint256 _tokenId);

    // transfer
    // lets owner send tokens to another user
    // recieving account has been approved
    //     contract MyNFT {
    //   mapping(address => mapping(uint256 => uint256)) private ownerTokens;
    //   function removeFromTokenList(address owner, uint256 _tokenId) private {
    //     for(uint256 i = 0;ownerTokens[owner][i] != _tokenId;i++){
    //       ownerTokens[owner][i] = 0;
    //     }
    //   }
    //   function transfer(address _to, uint256 _tokenId){
    //     address currentOwner = msg.sender;
    //     address newOwner = _to;
    //     require(tokenExists[_tokenId]);
    //     require(currentOwner == ownerOf(_tokenId));
    //     require(currentOwner != newOwner);
    //     require(newOwner != address(0));
    //     removeFromTokenList(_tokenId);
    //     balances[oldOwner] -= 1;
    //     tokenOwners[_tokenId] = newOwner;
    //     balances[newOwner] += 1;
    //     Transfer(oldOwner, newOwner, _tokenId);
    //   }
    // }
    function transfer(address _to, uint256 _tokenId);

    // tokenOfOwnerByIndex
    // optional- recommended
    // NFT owner can own more than 1
    //    mapping(address => mapping(uint256 => uint256)) private ownerTokens;
    //   function tokenOfOwnerByIndex(address _owner, uint256 _index) constant returns (uint tokenId){
    //     return ownerTokens[_owner][_index];
    //   }
    function tokenOfOwnerByIndex(address _owner, uint256 _index)
        constant
        returns (uint tokenId);

    // ------- Token metadata -------
    // Storing data on the blockchain is expensive
    // Metadata stores references to NFT characteristics

    // tokenMetadata
    // link to data
    //      mapping(uint256 => string) tokenLinks;
    //   function tokenMetadata(uint256 _tokenId) constant returns (string infoUrl) {
    //     return tokenLinks[_tokenId];
    //   }
    function tokenMetadata(uint256 _tokenId) constant returns (string infoUrl);

    // ------- Events -------
    // Events are fired when a contract calls them
    // Outside programs can listen to blockchain events

    // Transfer
    // fired when token changes addresses
    // which account sent the token
    // which account recieved the token
    // token ID
    //   event Transfer(address indexed _from, address indexed _to, uint256 _tokenId);
    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _tokenId
    );

    // Approval
    // fired when user approves another to take ownership of token
    // which account owns token
    // which account is approved
    // tokenID
    event Approval(
        address indexed _owner,
        address indexed _approved,
        uint256 _tokenId
    );
}

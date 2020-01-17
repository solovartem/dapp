;(async () => {
  const Web3 = require("web3")
  const url = "https://mainnet.infura.io/v3/d1d21a61b32a4f669b1438e9218cc279"
  const web3 = new Web3(url)
  const address = "0xB8c77482e45F1F44dE1745F52C74426C631bDD52"
  const findEtherByAccount = async (address, web3) => await web3.eth.getBalance(address)
  const weiBalance = await findEtherByAccount(address, web3)
  const ehterBalance = await web3.utils.fromWei(weiBalance, "ether")
})()

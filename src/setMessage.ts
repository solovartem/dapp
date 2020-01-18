;(async () => {
  const Web3 = require("web3")
  const web3 = new Web3(new Web3.providers.HttpProvider("https://ropsten.infura.io/v3/d1d21a61b32a4f669b1438e9218cc279"))
  const privateKey = "CCBF88AC64D9755A5CC5298E201920262DA425094C08F95D2ABA0E69AEEFFC92"
  const password = "hello"
  const encryptedPrivateKey = web3.eth.accounts.encrypt(privateKey, password)
  const decryptedPrivateKey = web3.eth.accounts.decrypt(encryptedPrivateKey, password)

  const ABI = [
    { constant: false, inputs: [{ internalType: "string", name: "_message", type: "string" }], name: "setMessage", outputs: [], payable: false, stateMutability: "nonpayable", type: "function" },
    { constant: true, inputs: [], name: "getMessage", outputs: [{ internalType: "string", name: "", type: "string" }], payable: false, stateMutability: "view", type: "function" }
  ]

  const smartContractAddress = "0x15B942C0229693a35f4452aeF91657602984AC74"
  const smartContract = new web3.eth.Contract(ABI, smartContractAddress)
  const rawTransaction = {
    to: smartContractAddress,
    value: 0,
    gas: 200000,
    chainId: 3,
    data: smartContract.methods.setMessage("hello blockchain").encodeABI()
  }

  // const signedTx = await decryptedPrivateKey.signTransaction(rawTransaction)
  // const result = await tryCatch(web3.eth.sendSignedTransaction, signedTx.rawTransaction)
  // console.log(result)

  // console.log(await smartContract.methods.getMessage().call())
})()

async function tryCatch(f: Function, x: any) {
  try {
    return await f(x)
  } catch (error) {
    console.warn(error)
  }
}
